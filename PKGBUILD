# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgroot=teleop_tools
_pkgname=teleop_tools_msgs
pkgname=ros2-humble-teleop-tools-msgs
pkgver=1.3.0
pkgrel=3
pkgdesc="The teleop_tools_msgs package"
url="https://index.ros.org/p/teleop_tools_msgs/"
arch=('any')
makedepends=('cmake')
depends=(
    'ros2-humble' 
)
source=("https://github.com/ros-teleop/teleop_tools/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('902e5fbdec909ee66e1b428df5076f125c231361211a1bd2a10b933fbc4d1f85')

prepare() {
    source /opt/ros/humble/setup.bash   
}

build() {
    cd "$_pkgroot-$pkgver/$_pkgname"
    python -m build --wheel --no-isolation 
}

package() {
    cd "$_pkgroot-$pkgver/$_pkgname"
    python -m installer --destdir="$pkgdir" --prefix="/opt/ros/humble" dist/*.whl
}
