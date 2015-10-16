# Contributor: Lukas Linhart <bugs@almad.net>
# Contributor: Changaco <changaco ατ changaco δοτ net>
# Contributor: Nicolas Pouillard <nicolas.pouillard@gmail.com>
# Contributor: Sean Greenslade <zootboysean@gmail.com>

pkgname=python2-rospkg
pkgver=1.0.37
pkgrel=1
pkgdesc="ROS - provides basic utilities for querying information about ROS packages, stacks, and distributions."
url="http://docs.ros.org/independent/api/rospkg/html/"
arch=('any')
license=('BSD')
depends=('python2')
makedepends=('python2-distribute')
conflicts=()
replaces=()
backup=()
source=("https://pypi.python.org/packages/source/r/rospkg/rospkg-${pkgver}.tar.gz")
sha256sums=('f99ae5bc4d2288caad42d195eb1210103eb23daedce2358fef0173b2c82e3fd7')

build() {
  cd ${srcdir}/rospkg-${pkgver}
  find -type f -print0 | xargs -0 sed -i -e 's/#!\/usr\/bin\/env python/#!\/usr\/bin\/env python2/g'
  python2 setup.py build
}
package() {
  cd ${srcdir}/rospkg-${pkgver}
  python2 setup.py install --optimize=1 --skip-build --prefix="/usr" --root="${pkgdir}"
}
