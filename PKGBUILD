# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=launch_param_builder
pkgname=ros2-humble-launch-param-builder
pkgver=0.1.1
pkgrel=5
pkgdesc="Python library for loading parameters in launch files"
url="https://index.ros.org/p/launch_param_builder/"
arch=('any')
makedepends=(python-build python-installer python-wheel)
depends=(
    'ros2-humble'
    'python-yaml'
    'ros2-humble-xacro'
)
source=("https://github.com/PickNikRobotics/launch_param_builder/archive/refs/tags/${pkgver}.tar.gz")
    source /opt/ros/humble/setup.bash

sha256sums=('2066c810d4ccc35577720f011e1a0daff5ed2b4bb9130d7fe64e48b3ed45cb07')


build() {
    source /opt/ros/humble/setup.bash

    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation 
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" --prefix="/opt/ros/humble" dist/*.whl
}
