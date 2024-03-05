# Maintainer: YangZhichao <1036711084@qq.com>
pkgname=ros2-humble-foxglove-msgs
pkgver=2.3.0
pkgrel=1
pkgdesc="Message schemas supported by Foxglove Studio"
arch=(x86_64)
url="https://github.com/foxglove/schemas"
license=('MIT')
depends=("ros2-humble")
makedepends=("git")
source=("https://github.com/foxglove/schemas/archive/refs/tags/ros-v$pkgver.tar.gz")
sha256sums=('ef37a00b166209fd9801efd7b7da9e0245b61fffa8c444835b9ae15ee28c7952')

build() {
	source /opt/ros/humble/setup.bash
	colcon build
}


package() {
	mkdir -p $pkgdir/opt/ros/humble
	cp -r $srcdir/install/foxglove_msgs/* $pkgdir/opt/ros/humble
}
