# Maintainer: Stella <jens300304@gmail.com>
pkgname=python-circlevis
url="https://github.com/circleguard/circlevis"
pkgver=1.4.6
pkgrel=1
pkgdesc="A Qt Widget for visualizing osu! beatmaps and replays."
arch=('any')
license=('GPL3')
source=(
    "https://github.com/circleguard/circlevis/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=('bab6a0a4ee22daad1cea4f4459cb7cf6b241491b3a91d1a727362ce18d85a1ee')
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
