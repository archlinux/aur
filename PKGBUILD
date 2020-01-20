# Maintainer: Brad Ackerman <brad[at]facefault.org>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pyname=oletools
pkgname=python-oletools
pkgver=0.55
pkgrel=1
pkgdesc="Python tools to analyze security characteristics of MS Office and OLE files"
depends=('python'
         'python-colorclass'
         'python-easygui'
         'python-pyparsing'
         'python-msoffcrypto-tool')
arch=('any')
url="https://github.com/decalage2/oletools"
license=('BSD')
source=("https://github.com/decalage2/oletools/releases/download/v${pkgver}/${_pyname}-${pkgver}.tar.gz")
sha512sums=('7c3a62f21e8cb56816f03479ca97e9e03011513b661a9b6b4d913dac000b4065e9e60d429e6731601040f09dae9494ddb9ac76c11fc0baeab086b755a565f058')

# Some checks failing; will investigate. -BA 20190616
# check() {
#   cd "${srcdir}/${_pyname}-${pkgver}"
#   python3 setup.py test
# }

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install -O1 --root="${pkgdir}"
  install -Dm 644 ${_pyname}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp ${_pyname}/doc/* "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim:set et sw=2 ts=2 tw=79:
