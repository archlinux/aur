# Maintainer: Angelo Elias Dal Zotto <angelodalzotto97@gmail.com>

_pkgname=teleop_twist_keyboard
pkgname=ros2-humble-teleop-twist-keyboard
pkgver=2.3.2
pkgrel=1
pkgdesc="A robot-agnostic teleoperation node to convert keyboard commands to Twist messages"
url="https://index.ros.org/p/teleop_twist_keyboard/"
arch=('any')
depends=('ros2-humble')
source=("https://github.com/ros2/teleop_twist_keyboard/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('8a7bf99f672759a45d23c8c5ac0b7ad32647f31373ff273adf9d45609aeb848b')

prepare() {
    source /opt/ros/humble/setup.bash
}

build() {
    colcon build --merge-install
}

package() {
    # Copy build files
    mkdir -p $pkgdir/opt/ros/humble
    cp -r $srcdir/install/* $pkgdir/opt/ros/humble/
    # Exclude files that clash with base ros installation
    rm $pkgdir/opt/ros/humble/*setup.*
    rm $pkgdir/opt/ros/humble/_local_setup*
    rm $pkgdir/opt/ros/humble/COLCON_IGNORE
}
