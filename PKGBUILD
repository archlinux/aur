# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Theora_image_transport provides a plugin to image_transport for transparently sending an image stream encoded with the Theora codec."
url='https://www.wiki.ros.org/image_transport_plugins'

pkgname='ros-noetic-theora-image-transport'
pkgver='1.9.5'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-dynamic-reconfigure
	ros-noetic-rosbag
	ros-noetic-catkin
	ros-noetic-cv-bridge
	ros-noetic-message-generation
	ros-noetic-std-msgs
	ros-noetic-pluginlib
	ros-noetic-image-transport
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
	libtheora
	libogg
)

ros_depends=(
	ros-noetic-dynamic-reconfigure
	ros-noetic-rosbag
	ros-noetic-cv-bridge
	ros-noetic-std-msgs
	ros-noetic-message-runtime
	ros-noetic-pluginlib
	ros-noetic-image-transport
)

depends=(
	${ros_depends[@]}
	libtheora
	libogg
)

_dir="image_transport_plugins-${pkgver}/theora_image_transport"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-perception/image_transport_plugins/archive/${pkgver}.tar.gz")
sha256sums=('8047bc717c83f04a1b05a7cfe70778d99a82ceb5eb717d480aab19513de0719c')

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
