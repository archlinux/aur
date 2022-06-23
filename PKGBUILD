# Maintainer : Frikilinux <frikilinux@gmail.com>

pkgname=python-qt-material
_name=${pkgname#python-}
pkgver=2.12
pkgrel=1
pkgdesc="Material inspired stylesheet for PySide2, PySide6, PyQt5 and PyQt6."
arch=('any')
url="https://github.com/UN-GCPDS/qt-material"
license=('BSD')
depends=('python-jinja') 
makedepends=('python-setuptools')
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha256sums=('4ead6710b4fa64f94963bf359422e077a032a84ec8c350804ff743d1be7f4657')

build() {
  cd "${_name}-${pkgver}"
  python setup.py build
}

package() {
  cd "${_name}-${pkgver}"
  python setup.py install --root="${pkgdir}/" --optimize=1 --skip-build
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
