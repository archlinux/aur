# Maintainer: gavin lyons <glyons66@hotmail.com>
# https://github.com/gavinlyonsrepo/Colossus_LTSM
pkgname=colossus
pkgver=1.0.3
pkgrel=1
pkgdesc="Tool for converting ttf fonts into data, aimed at users of embedded systems"
arch=('any')
url="https://github.com/gavinlyonsrepo/Colossus_LTSM"
license=('MIT')
depends=('python' 'tk' 'python-pillow')
makedepends=('python-build' 'python-installer' 'python-wheel')
source=("https://github.com/gavinlyonsrepo/Colossus_LTSM/archive/$pkgver.tar.gz")

sha256sums=('27af58b3fbd8da16c858cef2494506803bce681e599e2ffce1336fcdda347b9a')

build() {
    cd "$srcdir/Colossus_LTSM-${pkgver}"
    python -m build --wheel
}

package() {
    cd "$srcdir/Colossus_LTSM-${pkgver}"

    python -m installer --destdir="$pkgdir" dist/*.whl

    install -Dm644 extras/desktop/colossus.desktop "$pkgdir/usr/share/applications/colossus.desktop"
    install -Dm644 extras/desktop/colossus.png "$pkgdir/usr/share/pixmaps/colossus.png"
}
