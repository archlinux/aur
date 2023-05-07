# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=rgx-git
pkgver=0.2
pkgrel=1
pkgdesc="CLI RegExp Tool"
arch=('any')
url="https://github.com/comroid-git/rgx"
license=('MIT')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
source=("git+https://github.com/comroid-git/rgx.git")
md5sums=('SKIP')
options+=("!strip")

build() {
    cd rgx
    dotnet publish -c Release --use-current-runtime
}

package() {
    install -Dm755 "rgx/bin/Release/net6.0/linux-x64/publish/rgx" "$pkgdir/usr/bin/rgx"
}
