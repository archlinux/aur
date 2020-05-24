# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - turtle_actionlib demonstrates how to write an action server and client with the turtlesim."
url='https://wiki.ros.org/turtle_actionlib'

pkgname='ros-noetic-turtle-actionlib'
pkgver='0.1.11'
_pkgver_patch=0
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=3
license=('BSD')

ros_makedepends=(
	ros-noetic-angles
	ros-noetic-turtlesim
	ros-noetic-catkin
	ros-noetic-message-generation
	ros-noetic-actionlib-msgs
	ros-noetic-actionlib
	ros-noetic-rosconsole
	ros-noetic-roscpp
	ros-noetic-std-msgs
	ros-noetic-geometry-msgs
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-angles
	ros-noetic-turtlesim
	ros-noetic-actionlib-msgs
	ros-noetic-actionlib
	ros-noetic-rosconsole
	ros-noetic-roscpp
	ros-noetic-std-msgs
	ros-noetic-message-runtime
	ros-noetic-geometry-msgs
)

depends=(
	${ros_depends[@]}
)

_dir="common_tutorials-${pkgver}/turtle_actionlib"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros/common_tutorials/archive/${pkgver}.tar.gz")
sha256sums=('e6015c289219df58253809254baa53dbf2f3190b61d77fac2b2fb8b8c12f3ec1')

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
