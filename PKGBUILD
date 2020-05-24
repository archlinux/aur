# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - The tuw_airskin_msgs package."
url='https://github.com/tuw-robotics/tuw_msgs'

pkgname='ros-noetic-tuw-airskin-msgs'
pkgver='0.0.13'
arch=('any')
pkgrel=2
license=('BSD')

ros_makedepends=(ros-noetic-catkin
  ros-noetic-message-generation
  ros-noetic-geometry-msgs
  ros-noetic-std-msgs)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-message-runtime
  ros-noetic-geometry-msgs
  ros-noetic-std-msgs)
depends=(${ros_depends[@]})

_dir="tuw_msgs-${pkgver}/tuw_airskin_msgs"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/tuw-robotics/tuw_msgs/archive/${pkgver}.tar.gz")
sha256sums=('b22f12be8014a8855cd179d228ae5312102da4b3d176979f66f13e258cc418b6')

build() {
  # Use ROS environment variables
  source /usr/share/ros-build-tools/clear-ros-env.sh
  [ -f /opt/ros/noetic/setup.bash ] && source /opt/ros/noetic/setup.bash

  # Create build directory
  [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
  cd ${srcdir}/build

  # Build project
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
