# Script generated with import_catkin_packages.py.
# For more information: https://github.com/bchretien/arch-ros-stacks.
pkgdesc="ROS - The rotors_gazebo_plugins package"
url='https://wiki.ros.org/rotors_gazebo_plugins'

pkgname='ros-noetic-rotors-gazebo-plugins'
pkgver='2.2.3'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('ASL 2.0')

ros_makedepends=(
    ros-noetic-catkin
    ros-noetic-cmake-modules
    ros-noetic-cv-bridge
    ros-noetic-gazebo-plugins
    ros-noetic-gazebo-ros
    ros-noetic-geometry-msgs
    ros-noetic-mavros
    ros-noetic-mav-msgs
    ros-noetic-octomap-msgs
    ros-noetic-octomap-ros
    ros-noetic-octomap
    ros-noetic-rosbag
    ros-noetic-roscpp
    ros-noetic-rotors-comm
    ros-noetic-rotors-control
    ros-noetic-std-srvs
    ros-noetic-tf
)

makedepends=(
    cmake
    ros-build-tools
	${ros_makedepends[@]}
    gazebo
    google-glog
    protobuf
    yaml-cpp
)

ros_depends=(
)

depends=(
	${ros_depends[@]}
)

_dir="rotors_simulator-${pkgver}/rotors_gazebo_plugins"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ethz-asl/rotors_simulator/archive/${pkgver}.tar.gz")
sha256sums=('46e6be40ebd08ba41a4a532c1774228d240d11aa39ad82f9ab50e445dc4a6f20')

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
