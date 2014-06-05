# Contributor: Lukas Linhart <bugs@almad.net>
# Contributor: Changaco <changaco ατ changaco δοτ net>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Maintainer: Sean Greenslade <zootboysean@gmail.com>

pkgname=python2-rospkg
pkgver=1.0.28
pkgrel=1
pkgdesc="ROS - provides basic utilities for querying information about ROS packages, stacks, and distributions."
url="http://ros.org/doc/api/rospkg/html/python_api.html"
arch=('any')
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
conflicts=()
replaces=()
backup=()
source=(http://download.ros.org/downloads/rospkg/rospkg-${pkgver}.tar.gz)
md5sums=('16d44fb29c494e8609c8c86fc4e75f4d')

build() {
  cd ${srcdir}/rospkg-${pkgver}
  find -type f -print0 | xargs -0 sed -i -e 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/g'
}
package() {
  cd ${srcdir}/rospkg-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1 || return 1
}
