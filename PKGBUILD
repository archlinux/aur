# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=rgx-git
pkgver=0.2
pkgrel=3
pkgdesc="Commandline RegExp Tool"
arch=('any')
url="https://github.com/comroid-git/rgx"
license=('GPL-3.0')
depends=('dotnet-runtime-7.0')
makedepends=('dotnet-sdk-7.0')
source=("git+https://github.com/comroid-git/rgx.git" "git+https://github.com/comroid-git/csapi.git")
md5sums=('SKIP' 'SKIP')
options+=("!strip")

build() {
    cd rgx
    dotnet publish -c Release --use-current-runtime
}

package() {
    install -Dm755 "rgx/rgx/bin/Release/net7.0/linux-x64/publish/rgx" "$pkgdir/usr/bin/rgx"
}
