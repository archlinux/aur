# Maintainer: Sean Greenslade <zootboysean@gmail.com>

pkgdesc="ROS - python rosdistro package"
pkgname=python2-rosdistro
pkgver=0.2.8
pkgrel=1
arch=('any')
url='http://github.com/ros-infrastructure/rosdistro/'
license=('Apache')
depends=('python2')
makedepends=('python2-distribute')

build() {
  cd $srcdir
  git clone -b ${pkgver} git://github.com/ros-infrastructure/rosdistro.git
}

package() {
  cd ${srcdir}/rosdistro
  python2 setup.py install --root=${pkgdir} || return 1
}
