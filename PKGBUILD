# Maintainer: Jonathan Liu <net147@gmail.com>
pkgname=python2-openerp-client-lib
_realpkgname=openerp-client-lib
pkgver=1.1.2
pkgrel=1
pkgdesc="Easily interact with OpenERP in Python"
arch=('any')
url="http://pypi.python.org/pypi/openerp-client-lib"
license=('BSD')
depends=('python2')
source=("http://pypi.python.org/packages/source/o/${_realpkgname}/${_realpkgname}-${pkgver}.tar.gz")
md5sums=('3992ac5865057b7ed57b173f46727fdd')

build() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  python2 setup.py build
}

package() {
  cd "${srcdir}/${_realpkgname}-${pkgver}"
  python2 setup.py install --root "${pkgdir}" -O1
  install -Dm 644 openerplib/__init__.py "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
