# Script generated with import_catkin_packages.py
# For more information: https://github.com/bchretien/arch-ros-stacks
pkgdesc="ROS - Robot-independent Gazebo plugins for sensors, motors and dynamic reconfigurable components."
url='https://wiki.ros.org/gazebo_plugins'

pkgname='ros-noetic-gazebo-plugins'
pkgver='2.9.1'
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'armv6h')
pkgrel=1
license=('BSD, Apache 2.0')

ros_makedepends=(ros-noetic-diagnostic-updater
  ros-noetic-rosgraph-msgs
  ros-noetic-std-srvs
  ros-noetic-cv-bridge
  ros-noetic-rosconsole
  ros-noetic-tf
  ros-noetic-std-msgs
  ros-noetic-gazebo-msgs
  ros-noetic-catkin
  ros-noetic-gazebo-dev
  ros-noetic-geometry-msgs
  ros-noetic-dynamic-reconfigure
  ros-noetic-trajectory-msgs
  ros-noetic-nodelet
  ros-noetic-tf2-ros
  ros-noetic-urdf
  ros-noetic-nav-msgs
  ros-noetic-sensor-msgs
  ros-noetic-camera-info-manager
  ros-noetic-angles
  ros-noetic-roscpp
  ros-noetic-polled-camera
  ros-noetic-image-transport
  ros-noetic-message-generation
  ros-noetic-rospy)
makedepends=('cmake' 'ros-build-tools'
  ${ros_makedepends[@]})

ros_depends=(ros-noetic-diagnostic-updater
  ros-noetic-rosgraph-msgs
  ros-noetic-std-srvs
  ros-noetic-cv-bridge
  ros-noetic-rosconsole
  ros-noetic-tf
  ros-noetic-std-msgs
  ros-noetic-gazebo-msgs
  ros-noetic-geometry-msgs
  ros-noetic-trajectory-msgs
  ros-noetic-dynamic-reconfigure
  ros-noetic-message-runtime
  ros-noetic-nodelet
  ros-noetic-tf2-ros
  ros-noetic-urdf
  ros-noetic-nav-msgs
  ros-noetic-sensor-msgs
  ros-noetic-camera-info-manager
  ros-noetic-angles
  ros-noetic-roscpp
  ros-noetic-polled-camera
  ros-noetic-image-transport
  ros-noetic-gazebo-dev
  ros-noetic-rospy)
depends=(${ros_depends[@]})

_dir="gazebo_ros_pkgs-${pkgver}/gazebo_plugins"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/ros-simulation/gazebo_ros_pkgs/archive/${pkgver}.tar.gz")
sha256sums=('9fac7aa1e9773aae20cfef1ec062353f91e4546ebd638e1df2e3f8b51f1e0773')

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
