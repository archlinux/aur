# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - tf2_geometry_msgs."
url='https://wiki.ros.org/tf2_ros'

pkgname='ros-noetic-tf2-geometry-msgs'
pkgver='0.6.5'
arch=('any')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-noetic-tf2
	ros-noetic-python-orocos-kdl
	ros-noetic-catkin
	ros-noetic-tf2-ros
	ros-noetic-orocos-kdl
	ros-noetic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-tf2
	ros-noetic-python-orocos-kdl
	ros-noetic-tf2-ros
	ros-noetic-orocos-kdl
	ros-noetic-geometry-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="geometry2-${pkgver}/tf2_geometry_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/geometry2/archive/${pkgver}.tar.gz")
sha256sums=('9a1268621518fc22afd7b12ef1cf30e6901a57b054535924d1d74fd5d267773a')

build() {
	# Use ROS environment variables.
	source /usr/share/ros-build-tools/clear-ros-env.sh
	[ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

	# Create the build directory.
	[ -d ${srcdir}/build ] || mkdir ${srcdir}/build
	cd ${srcdir}/build

	# Build the project.
	cmake ${srcdir}/${_dir} \
		-DCATKIN_BUILD_BINARY_PACKAGE=ON \
		-DCMAKE_INSTALL_PREFIX=/opt/ros/noetic \
		-DPYTHON_EXECUTABLE=/usr/bin/python \
		-DSETUPTOOLS_DEB_LAYOUT=OFF
	make
}

package() {
	cd "${srcdir}/build"
	make DESTDIR="${pkgdir}/" install
}
