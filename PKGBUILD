# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-circlevis
url="https://github.com/circleguard/circlevis"
pkgver=1.4.2
pkgrel=1
pkgdesc="A Qt Widget for visualizing osu! beatmaps and replays."
arch=('any')
license=('GPL3')
source=(
    "https://github.com/circleguard/circlevis/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    'd7361e0ed07d4fef834f18a14baef058907fb95af9191bad8d83dfc1d719db65'
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
    python setup.py install --root="$pkgdir" --optimize=1
}
