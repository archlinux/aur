# Maintainer: Finn-Thorben Sell <aur@finn-thorben.me>
pkgname="ros-dashing-ament-package"
pkgdesc="ROS - The parser for the manifest files in the ament buildsystem"
url="https://index.ros.org/doc/ros2/"
license=("Apache License 2.0")

pkgver=0.7.0
pkgrel=1
arch=('any')
#provides=("$(echo ${pkgname} | sed s/-git//g)")
conflicts=()
options=()
install=

_ros_makedepends=()
makedepends=(cmake ros-build-tools
	${_ros_makedepends[@]})

_ros_depends=()
depends=(cmake python-setuptools
	${_ros_depends[@]})

_dir="ament_package-release-release-dashing-ament_package-${pkgver}-0"
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/ros2-gbp/ament_package-release/archive/release/dashing/ament_package/${pkgver}-0.tar.gz")
sha256sums=('ecbe87966d711b8756d0b34518b628107b326fbd226206df088e99a1162924a1')


package() {
	cd "${srcdir}/${_dir}"
	python setup.py install --root="${pkgdir}" --prefix="/opt/ros/dashing" --optimize=1
}
