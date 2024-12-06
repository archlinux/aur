# Maintainer: Fabius
pkgname=pixterm
pkgver=1.3.2
pkgrel=2
pkgdesc="Draw images in your ANSI terminal with true color"
arch=(x86_64 i686)
url=https://github.com/eliukblau/pixterm
license=(MPL2)
makedepends=(go)
provides=(pixterm)
conflicts=(pixterm-git)
source=(https://github.com/eliukblau/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=(9688fff2245f228728e33f22a135a7888d8fa9f7f08e51f6ff03c0d028eb0de1)

build() {
    cd "$srcdir/$pkgname-$pkgver/cmd/pixterm"
    go build -o ../../pixterm
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 pixterm "$pkgdir/usr/bin/pixterm"
}
