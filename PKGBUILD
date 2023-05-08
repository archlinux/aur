# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=rgx-git
pkgver=0.2
pkgrel=2
pkgdesc="CLI RegExp Tool"
arch=('any')
url="https://github.com/comroid-git/rgx"
license=('MIT')
depends=('dotnet-runtime-7.0')
makedepends=('dotnet-sdk-7.0')
source=("git+https://github.com/comroid-git/rgx.git")
md5sums=('SKIP')
options+=("!strip")

build() {
    cd rgx
    dotnet publish -c Release --use-current-runtime
}

package() {
    install -Dm755 "rgx/bin/Release/net7.0/linux-x64/publish/rgx" "$pkgdir/usr/bin/rgx"
}
