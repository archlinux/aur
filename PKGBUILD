# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=urdf_parser_py
pkgname=ros2-humble-urdf-parser-py
pkgver=1.2.1
pkgrel=3
pkgdesc="Python implementation of the URDF parser"
url="https://index.ros.org/p/urdf_parser_py/"
arch=('any')
makedepends=('python-mock')
depends=(
    'ros2-humble'
    'python-lxml'
    'python-yaml'
)
makedepends=(python-build python-installer python-wheel)
source=("https://github.com/ros/urdf_parser_py/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('35252568e329c86ee352c4285ad12dbd3430c88abbe441078687cd49f843f591')


build() {
    source /opt/ros/humble/setup.bash

    cd "$_pkgname-$pkgver"
    python -m build --wheel --no-isolation 
}

package() {
    cd "$_pkgname-$pkgver"
    python -m installer --destdir="$pkgdir" --prefix="/opt/ros/humble" dist/*.whl
}
