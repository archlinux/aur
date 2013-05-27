# Maintainer: Sean Greenslade <zootboysean[at]gmail[dot]com>
pkgname=python2-rosdep
pkgver=0.10.18
pkgrel=2
pkgdesc="Command-line tool for installing system dependencies on a variety of platforms."
url="http://ros.org/doc/api/rosdep2/html/"
arch=('x86_64' 'i686')
license=('BSD')
depends=('python2' 'python2-rosdistro')
optdepends=()
makedepends=('python2-distribute')

build() {
  cd $srcdir
  git clone -b ${pkgver} git://github.com/ros/rosdep.git
}

package() {
  cd ${srcdir}/rosdep
  python2 setup.py install --root=${pkgdir} || return 1
}

