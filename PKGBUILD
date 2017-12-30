# Maintainer: David Runge <dave@sleepmap.de>
# Contributor:  Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ninez <triplesquarednine@gmail.com>

_upstream_name=python-schedutils
pkgname=python2-schedutils
pkgver=0.6
pkgrel=1
pkgdesc="Python interface for the Linux scheduler functions etc."
arch=('x86_64')
url="https://git.kernel.org/cgit/libs/python/python-schedutils/python-schedutils.git/"
license=('GPL')
depends=('python2')
source=("https://git.kernel.org/pub/scm/libs/python/${_upstream_name}/${_upstream_name}.git/snapshot/${_upstream_name}-${pkgver}.tar.gz")
sha512sums=('e340cd60045f5f96ad722b1651ef5e26c3a99a4a986fbbcb0319e036a76a56c67b9b3792936da05776e43b4c92605f820f7fe6294b6197c00e5360c39767807b')

build() {
  cd "${_upstream_name}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${_upstream_name}-${pkgver}"
  python2 setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"
}
# vim:set ts=2 sw=2 et:
