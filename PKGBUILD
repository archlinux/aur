# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Package for Nodelet tutorial."
url='https://wiki.ros.org/nodelet_tutorial_math'

pkgname='ros-noetic-nodelet-tutorial-math'
pkgver='0.1.11'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=4
license=('BSD')

ros_makedepends=(
	ros-noetic-nodelet
	ros-noetic-std-msgs
	ros-noetic-roscpp
	ros-noetic-catkin
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-nodelet
	ros-noetic-std-msgs
	ros-noetic-roscpp
)

depends=(
	${ros_depends[@]}
)

_dir="common_tutorials-${pkgver}/nodelet_tutorial_math"
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
