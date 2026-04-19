# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/Guardian_LTSM
pkgname=guardian
pkgver=0.3.0
pkgrel=1
pkgdesc="Tool for converting images into data & back, aimed at users of embedded systems"
arch=('any')
url="https://github.com/gavinlyonsrepo/Guardian_LTSM"
license=('MIT')
depends=('python' 'tk' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/gavinlyonsrepo/Guardian_LTSM/archive/$pkgver.tar.gz")

sha256sums=('b765c51786fdb4f567bfec663d1e26213f9162728907bd1ad50d6367a7c45607')

build() {
    cd "$srcdir/Guardian_LTSM-${pkgver}"
    python -m build --wheel
}

package() {
    cd "$srcdir/Guardian_LTSM-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 extras/desktop/guardian.desktop "$pkgdir/usr/share/applications/guardian.desktop"
    install -Dm644 extras/desktop/guardian.png "$pkgdir/usr/share/pixmaps/guardian.png"
}
