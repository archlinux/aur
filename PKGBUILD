# Maintainer: Aaron DeVore <aaron.devore@gmail.com>
# Contributor: Alper KANAT  <alperkanat@raptiye.org>
# Contributor: Thomas Dziedzic < gostrc at gmail >

pkgname=python2-simpletal
pkgver=4.3
pkgrel=1
pkgdesc='Standalone Python2 implementation of the TAL, TALES and METAL specifications used in Zope to power HTML and XML templates.'
arch=('any')
url='http://www.owlfish.com/software/simpleTAL/'
license=('BSD')
depends=('python2')
changelog=Changelog
source=("http://www.owlfish.com/software/simpleTAL/downloads/SimpleTAL-${pkgver}.tar.gz")
md5sums=('147035bae18e4d37aea26c7d2019a0d2')

build() {
  cd SimpleTAL-${pkgver}

  python2 setup.py build
}

package() {
  cd SimpleTAL-${pkgver}

  python2 setup.py install --root=${pkgdir} --optimize=1

  install -D -m644 ${srcdir}/SimpleTAL-${pkgver}/LICENSE.txt \
    ${pkgdir}/usr/share/licenses/${pkgname}/license
}
