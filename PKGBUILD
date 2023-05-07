# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=rgx-git
pkgver=0.1
pkgrel=2
pkgdesc="CLI RegExp Tool"
arch=('any')
url="https://github.com/comroid-git/rgx"
license=('MIT')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
source=("git+https://github.com/comroid-git/rgx.git" "git+https://github.com/comroid-git/csapi.git")
md5sums=('SKIP' 'SKIP')

build() {
    cd "$srcdir/rgx"
    dotnet publish -c Release
}

package() {
    cd "$srcdir/rgx"
    install -Dm755 bin/Release/net6.0/rgx "$pkgdir/usr/bin/rgx"
}
