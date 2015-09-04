# Maintainer: crito <crito@cryptodrunks.net>
pkgname=python2-u1db
pkgver=0.1.4
pkgrel=1
pkgdesc="A database API for synchronized databases of JSON documents."
arch=('any')
url="https://launchpad.net/u1db"
license=('LGPL3')
depends=('python2>=2.7' 'python2-paste' 'python2-routes' 'python2-dirspec')
makedepends=('python2-sphinx' 'make')
source=("https://launchpad.net/u1db/trunk/0.1.4/+download/u1db-${pkgver}.tar.bz2")
md5sums=('4c3b400ca8def79cd5aee48f5fc13888')

package() {
  cd "${srcdir}/u1db-${pkgver}"
  python2 setup.py install --root="${pkgdir}/" --optimize=1
  install -Dm644 COPYING.LESSER "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  # Build the docs as well - Fails now because two doctests fail
  #cd "${srcdir}/u1db-${pkgver}/html-docs"
  #make SPHINXBUILD=/usr/bin/sphinx-build2 html
  #install -Dm755 _build/html "${pkgdir}/usr/share/doc/${pkgname}/html"
}

# vim:set ts=2 sw=2 et:
