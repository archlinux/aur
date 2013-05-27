# Contributor: Lukas Linhart <bugs@almad.net>
# Contributor: Changaco <changaco ατ changaco δοτ net>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Maintainer: Sean Greenslade <zootboysean@gmail.com>

pkgname=python2-rospkg
pkgver=1.0.19
pkgrel=3
pkgdesc="ROS - provides basic utilities for querying information about ROS packages, stacks, and distributions."
url="http://ros.org/doc/api/rospkg/html/python_api.html"
arch=('any')
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
conflicts=()
replaces=()
backup=()
source=(http://pr.willowgarage.com/downloads/rospkg/rospkg-${pkgver}.tar.gz)
md5sums=('3315b1b2129ec6844452a4eae752b9a5')

build() {
  cd ${srcdir}/rospkg-${pkgver}
  find -type f -print0 | xargs -0 sed -i -e 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/g'
}
package() {
  cd ${srcdir}/rospkg-${pkgver}
  python2 setup.py install --root="${pkgdir}" --optimize=1 || return 1
}
