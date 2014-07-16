# Maintainer: Sean Greenslade <zootboysean[at]gmail[dot]com>
pkgname=python2-rosdep
pkgver=0.10.28
pkgrel=1
pkgdesc="Command-line tool for installing system dependencies on a variety of platforms."
url="http://ros.org/doc/api/rosdep2/html/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('python2' 'python2-catkin_pkg' 'python2-rospkg' 'python2-rosdistro' 'python2-yaml')
optdepends=()
makedepends=('python2-distribute')

source=("rosdep"::"git+https://github.com/ros/rosdep.git"#tag=${pkgver})
md5sums=('SKIP')

build() {
  cd $srcdir/rosdep
  python2 setup.py build
}

package() {
  cd ${srcdir}/rosdep
  python2 setup.py install -O1 --skip-build --root "${pkgdir}" --prefix=/usr
}

