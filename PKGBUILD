# Script generated with create_pkgbuild.py
    # For more information: https://github.com/ros-melodic-arch/ros-build-tools-py3
    pkgdesc="ROS - The mbf_costmap_nav package contains the costmap navigation server implementation of Move Base Flex (MBF)."
    url='http://wiki.ros.org/move_base_flex'

    pkgname='ros-melodic-mbf-costmap-nav'
    pkgver='0.3.3'
    arch=('any')
    pkgrel=1
    license=('3-Clause BSD')

    ros_makedepends=(ros-melodic-std-msgs
  ros-melodic-mbf-msgs
  ros-melodic-mbf-abstract-nav
  ros-melodic-nav-msgs
  ros-melodic-mbf-costmap-core
  ros-melodic-std-srvs
  ros-melodic-nav-core
  ros-melodic-geometry-msgs
  ros-melodic-tf
  ros-melodic-actionlib-msgs
  ros-melodic-catkin
  ros-melodic-base-local-planner
  ros-melodic-roscpp
  ros-melodic-dynamic-reconfigure
  ros-melodic-actionlib
  ros-melodic-pluginlib
  ros-melodic-mbf-utility)
    makedepends=('cmake' 'ros-build-tools'
    ${ros_makedepends[@]}
    )

    ros_depends=(ros-melodic-std-msgs
  ros-melodic-mbf-msgs
  ros-melodic-mbf-abstract-nav
  ros-melodic-nav-msgs
  ros-melodic-move-base
  ros-melodic-mbf-costmap-core
  ros-melodic-move-base-msgs
  ros-melodic-std-srvs
  ros-melodic-nav-core
  ros-melodic-geometry-msgs
  ros-melodic-tf
  ros-melodic-actionlib-msgs
  ros-melodic-base-local-planner
  ros-melodic-roscpp
  ros-melodic-dynamic-reconfigure
  ros-melodic-actionlib
  ros-melodic-pluginlib
  ros-melodic-mbf-utility)
depends=(${ros_depends[@]}

    )
# Tarball version (faster download)
_dir="move_base_flex-release-release-melodic-mbf_costmap_nav"
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/uos-gbp/move_base_flex-release/archive/release/melodic/mbf_costmap_nav/${pkgver}.tar.gz")
sha256sums=('ce50ae3e4680f916d8091f5ba11d3273c80c5447537031acaf840d5c8c45564b')
    build() {
        # Use ROS environment variables
        source /usr/share/ros-build-tools/clear-ros-env.sh
        [ -f /opt/ros/melodic/setup.bash ] && source /opt/ros/melodic/setup.bash

        # Create build directory
        [ -d ${srcdir}/build ] || mkdir ${srcdir}/build
        cd ${srcdir}/build

        # Fix Python2/Python3 conflicts
        /usr/share/ros-build-tools/fix-python-scripts.sh -v 3 ${srcdir}/${_dir}

        # Build project
        cmake ${srcdir}/${_dir} \
                -DCMAKE_BUILD_TYPE=Release \
                -DCATKIN_BUILD_BINARY_PACKAGE=ON \
                -DCMAKE_INSTALL_PREFIX=/opt/ros/melodic \
                -DPYTHON_EXECUTABLE=/usr/bin/python3 \
                -DPYTHON_INCLUDE_DIR=/usr/include/python3.8m \
                -DPYTHON_LIBRARY=/usr/lib/libpython3.8m.so \
                -DPYTHON_BASENAME=.cpython-38m \
                -DSETUPTOOLS_DEB_LAYOUT=OFF
    make
    }

    package() {
    cd "${srcdir}/build"
    make DESTDIR="${pkgdir}/" install
    }
    
