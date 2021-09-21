# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-wtc
url="https://github.com/circleguard/wtc-lzma-compressor"
pkgver=1.2.1
pkgrel=1
pkgdesc="An extension of the lzma compression format designed to make osu!std replays smaller."
arch=('any')
license=('MIT')
source=(
    "https://github.com/circleguard/wtc-lzma-compressor/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    'c6f693a510bcbfb59c1898778fe93f4c3be347eaaa68b55dcac283206d2f5e2a'
)
depends=('python')
makedepends=('python-setuptools')
conflicts=('python-wtc-git')

build() {
    cd "$srcdir/wtc-lzma-compressor-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/wtc-lzma-compressor-${pkgver}"
    python setup.py install --root="$pkgdir" --optimize=1
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
