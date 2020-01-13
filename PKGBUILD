# Maintainer: hexchain <i at hexchain dot org>

pkgname=pcm
pkgver=201902
pkgrel=1
pkgdesc="Processor Counter Monitor"
url="https://github.com/opcm/pcm/"
arch=('x86_64')
license=('BSD 3-Clause')
depends=('gcc-libs')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('0f7c3fb272bb45a56b5ddf67c40c23fda2e179f657240080d74e8b9f1a246e7f')

build() {
    cd "$srcdir/$pkgname-$pkgver"

    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 ./*.x -t "$pkgdir/usr/bin/"
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
