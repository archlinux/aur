# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=redir-git
pkgver=0.1
pkgrel=1
pkgdesc="Standard IO redirection to Socket"
arch=('any')
url="https://github.com/comroid-git/redir"
license=('GPL-3.0')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
source=("git+https://github.com/comroid-git/redir.git" "git+https://github.com/comroid-git/csapi.git")
md5sums=('SKIP' 'SKIP')
options+=("!strip")

build() {
    cd redir
    dotnet publish -c Release --use-current-runtime
}

package() {
    install -Dm755 "redir/redir/bin/Release/net6.0/linux-x64/publish/redir" "$pkgdir/usr/bin/redir"
}
