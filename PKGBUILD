# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/Guardian_LTSM
pkgname=guardian
pkgver=0.2.0
pkgrel=1
pkgdesc="Tool for converting images into data & back, aimed at users of embedded systems"
arch=('any')
url="https://github.com/gavinlyonsrepo/Guardian_LTSM"
license=('MIT')
depends=('python' 'tk' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/gavinlyonsrepo/Guardian_LTSM/archive/$pkgver.tar.gz")

sha256sums=('e2986ee89688b148d57458f563fca579c78a0203b3ed228f2eb65e0a75872fcd')

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
