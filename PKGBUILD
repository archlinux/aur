# Contributor: Alper KANAT  <alperkanat@raptiye.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=python-simpletal
pkgver=5.1
pkgrel=1
pkgdesc='Standalone Python implementation of the TAL, TALES and METAL specifications used in Zope to power HTML and XML templates.'
arch=('any')
url='http://www.owlfish.com/software/simpleTAL/'
license=('BSD')
depends=('python')
source=("http://www.owlfish.com/software/simpleTAL/downloads/SimpleTAL-${pkgver}.tar.gz")
md5sums=('2c43fb2376d501c2957bda26c81c419f')

build() {
  cd SimpleTAL-${pkgver}

  python setup.py build
}

package() {
  cd SimpleTAL-${pkgver}

  python setup.py install --root=${pkgdir} --optimize=1

  install -D -m644 ${srcdir}/SimpleTAL-${pkgver}/LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/license
}
