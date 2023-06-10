
# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=joint_state_publisher
_pkgname=joint_state_publisher
pkgname=ros2-humble-joint-state-publisher
pkgver=2.3.0
pkgrel=4
pkgdesc="This package contains a tool for setting and publishing joint state values for a given URDF"
url="https://index.ros.org/p/joint_state_publisher/"
arch=('any')
makedepends=(python-build python-installer python-wheel)
depends=(
    'ros2-humble'
)
source=("https://github.com/ros/joint_state_publisher/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('648d177b988b1da6316cea552cd999c37dd35ec514f7d1d9edd4a823ab2656d3')


build() {
    source /opt/ros/humble/setup.bash

    cd "$_pkgroot-$pkgver/$_pkgname"
    python -m build --wheel --no-isolation 
}

package() {
    cd "$_pkgroot-$pkgver/$_pkgname"
    python -m installer --destdir="$pkgdir" --prefix="/opt/ros/humble" dist/*.whl
}
