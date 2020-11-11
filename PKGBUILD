# Maintainer: David Runge <dave@sleepmap.de>
# Contributor: Joakim Hernberg <jhernberg@alchemy.lu>
# Contributor: Ninez <triplesquarednine@gmail.com>

pkgname=python-schedutils
pkgver=0.6
pkgrel=9
pkgdesc="Python interface for the Linux scheduler functions etc."
arch=('x86_64')
url="https://git.kernel.org/cgit/libs/python/python-schedutils/python-schedutils.git/"
license=('GPL2')
depends=('python')
makedepends=('python-setuptools')
source=("https://git.kernel.org/pub/scm/libs/python/${pkgname}/${pkgname}.git/snapshot/${pkgname}-${pkgver}.tar.gz")
sha512sums=('e340cd60045f5f96ad722b1651ef5e26c3a99a4a986fbbcb0319e036a76a56c67b9b3792936da05776e43b4c92605f820f7fe6294b6197c00e5360c39767807b')

build() {
  cd "${pkgname}-${pkgver}"
  python setup.py build
}

package_python-schedutils() {
  cd "${pkgname}-${pkgver}"
  python setup.py install --skip-build \
    --optimize=1 \
    --prefix=/usr \
    --root="${pkgdir}/"
  install -vDm 644 {ChangeLog,README} -t "${pkgdir}/usr/share/doc/${pkgname}"
}
