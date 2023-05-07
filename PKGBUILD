# Maintainer: Tobias Burdow <kaleidox@comroid.org>

pkgname=rgx-git
pkgver=0.1
pkgrel=1
pkgdesc="CLI RegExp Tool"
arch=('any')
url="https://github.com/comroid-git/rgx"
license=('MIT')
depends=('dotnet-runtime-6.0')
makedepends=('dotnet-sdk-6.0')
source=("$pkgname-$pkgver.tar.gz::https://github.com/comroid-git/rgx/tarball/master")

build() {
    cd "$srcdir"
    dotnet build -c Release
}

package() {
    cd "$srcdir"
    install -Dm755 bin/Release/net6.0/rgx "$pkgdir/usr/bin/rgx"
}
