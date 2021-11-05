# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-circlevis
url="https://github.com/circleguard/circlevis"
pkgver=1.4.3
pkgrel=1
pkgdesc="A Qt Widget for visualizing osu! beatmaps and replays."
arch=('any')
license=('GPL3')
source=(
    "https://github.com/circleguard/circlevis/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '5c8a0af0f894f252d180752f9685e41142f3598b4d535714cd02928f5a626a92'
)
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
