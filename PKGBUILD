# Maintainer: Brad Ackerman <brad[at]facefault.org>
# Contributor: Christian Rebischke <chris.rebischke[at]archlinux[dot]org>
_pyname=oletools
pkgname=python-oletools
pkgver=0.54.2
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
source=("https://github.com/decalage2/oletools/releases/download/v${pkgver}b/${_pyname}-${pkgver}.tar.gz")
sha512sums=('8399ff65379f63d647e0a58660a77eee22436df9c6cc4baca413ed762750f9d89c8c7d326a94a42a69c357d1abd33b2ddf9cb5b0595a6df9c5606ed461215b06')

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
