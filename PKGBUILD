# Maintainer: Levente Polyak <levente[at]leventepolyak[dot]net>

pkgbase=python-olefile
_pyname=olefile
pkgname=('python-olefile' 'python2-olefile')
pkgver=0.42.1
pkgrel=1
pkgdesc="Python library to parse, read and write Microsoft OLE2 files (formerly OleFileIO_PL)"
url="http://www.decalage.info/olefile"
arch=('any')
license=('BSD')
source=(https://bitbucket.org/decalage/olefileio_pl/downloads/${_pyname}-${pkgver}.zip)
sha512sums=('85daac386783cec4d7d725193c9f29a8ed384b2725a755c25f13ff11a36720094faa1c77769fdf93789e73dc50a4a4fd7cdd123cd3ed39f66038a77d6069deb9')

package_python-olefile() {
  depends=('python')
  replaces=('python3-olefileio')
  conflicts=('python3-olefileio')

  cd ${_pyname}-${pkgver}
  python setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 ${_pyname}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp ${_pyname}/doc/* "${pkgdir}/usr/share/doc/${pkgname}"

}

package_python2-olefile() {
  depends=('python2')
  replaces=('python2-olefileio')
  conflicts=('python2-olefileio')

  cd ${_pyname}-${pkgver}
  python2 setup.py install -O1 --root="${pkgdir}" --prefix=/usr
  install -Dm 644 ${_pyname}/LICENSE.txt "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  install -Dm 644 README.md "${pkgdir}/usr/share/doc/${pkgname}/README"
  cp ${_pyname}/doc/* "${pkgdir}/usr/share/doc/${pkgname}"
}

# vim: ts=2 sw=2 et:
