# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - Compressed_image_transport provides a plugin to image_transport for transparently sending images encoded as JPEG or PNG."
url='https://www.wiki.ros.org/image_transport_plugins'

pkgname='ros-noetic-compressed-image-transport'
pkgver='1.9.5'
_pkgver_patch=0
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(
	ros-noetic-cv-bridge
	ros-noetic-dynamic-reconfigure
	ros-noetic-catkin
	ros-noetic-image-transport
)

makedepends=(
	'cmake'
	'ros-build-tools'
	${ros_makedepends[@]}
)

ros_depends=(
	ros-noetic-cv-bridge
	ros-noetic-dynamic-reconfigure
	ros-noetic-image-transport
)

depends=(
	${ros_depends[@]}
)

_dir="image_transport_plugins-${pkgver}/compressed_image_transport"
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
