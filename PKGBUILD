# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=202101
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/opcm/pcm"
arch=('x86_64')
license=('custom:BSD-3-Clause')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('a1b2b9f6e7ae797c8a3e1551ce8933017d59b3cc9e7de5bcb37ea14439441c21')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 ./*.x -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
