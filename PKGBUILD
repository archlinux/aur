# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-circlecore
url="https://github.com/circleguard/circlecore"
pkgver=5.2.5
pkgrel=2
pkgdesc="A utilities library for osu!."
arch=('any')
license=('GPL3')
source=(
    "https://github.com/circleguard/circlecore/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    '8fa6bc18bc2c9b3a0d4163548a61034b25500646247866436c36311056d2ac62'
)
depends=(
    'python'
    'python-slider>=0.5.1'
    'python-scipy'
    'python-requests'
    'python-numpy'
    'python-wtc=1.2.1'
    'python-ossapi>=2'
    'python-ossapi<3'
    'python-osrparse>=6'
)
makedepends=('python-setuptools')
conflicts=('python-circlecore-git')

build() {
    cd "$srcdir/circlecore-${pkgver}"
    # required due to conflict between this and python-osrparse. can't test anyways.
    rm -rf tests
    python setup.py build
}

package() {
    cd "$srcdir/circlecore-${pkgver}"
    python setup.py install --root="$pkgdir"
}
