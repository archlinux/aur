# Contributor: Lukas Linhart <bugs@almad.net>
# Contributor: Changaco <changaco ατ changaco δοτ net>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Sean Greenslade <zootboysean@gmail.com>

pkgname=python2-rospkg
pkgver=1.0.29
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
md5sums=('26cfd8a4911af56627802ba327d44a7f')

build() {
  cd ${srcdir}/rospkg-${pkgver}
  find -type f -print0 | xargs -0 sed -i -e 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/g'
  python2 setup.py build
}
package() {
  cd ${srcdir}/rospkg-${pkgver}
  python2 setup.py install --optimize=1 --skip-build --prefix="/usr" --root="${pkgdir}"
}
