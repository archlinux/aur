# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-circlevis
url="https://github.com/circleguard/circlevis"
pkgver=1.4.5
pkgrel=1
pkgdesc="A Qt Widget for visualizing osu! beatmaps and replays."
arch=('any')
license=('GPL3')
source=(
    "https://github.com/circleguard/circlevis/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('b21d093a4ba4f250352b4d460717677a1b209d517721208f0cf938ebc2cdc3a7')
depends=(
    'python-circlecore>=5.2.3'
    'python-circlecore<6'
    'python'
    'python-slider>=0.4'
    'python-pyqt5'
)
makedepends=('python-setuptools')
conflicts=('python-circlevis-git')

build() {
    cd "$srcdir/circlevis-${pkgver}"
    python setup.py build
}

package() {
    cd "$srcdir/circlevis-${pkgver}"
    python setup.py install --root="$pkgdir"
}
