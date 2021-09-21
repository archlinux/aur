# Maintainer: Vasil Bakalov <jens300304@gmail.com>
pkgname=python-circlecore
url="https://github.com/circleguard/circlecore"
pkgver=5.2.3
pkgrel=1
pkgdesc="A utilities library for osu!."
arch=('any')
license=('GPL3')
source=(
    "https://github.com/circleguard/circlecore/archive/refs/tags/v${pkgver}.tar.gz"
)
sha256sums=(
    'a5ac7dc0dc1f348ec6ef4fcb0f675e88457c736ab018cb83579444b9a521511f'
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
    'python-osrparse>=5'
    'python-osrparse<6'
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
