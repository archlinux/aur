# Maintainer: Fabius
pkgname=pixterm
pkgver=1.3.1
pkgrel=1
pkgdesc="Draw images in your ANSI terminal with true color"
arch=(x86_64 i686)
url=https://github.com/eliukblau/pixterm
license=(MPL2)
makedepends=(go)
provides=(pixterm)
conflicts=(pixterm-git)
source=(https://github.com/eliukblau/$pkgname/archive/v$pkgver.tar.gz)
sha256sums=(cf824dda268b931e8af6867af0576aaa53b42eec286e1ae38bed77561c0be482)

build() {
    cd "$srcdir/$pkgname-$pkgver/cmd/pixterm"
    go build -o ../../pixterm
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 pixterm "$pkgdir/usr/bin/pixterm"
}
