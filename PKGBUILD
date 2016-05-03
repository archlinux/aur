# Maintainer: Chris Warrick <aur@chriswarrick.com>
pkgname=datecalc
_pyname=datecalc
pkgver=0.2.0
pkgrel=1
pkgdesc='A simple date calculator.'
arch=('any')
url='https://github.com/Kwpolska/datecalc'
license=('BSD')
makedepends=('python' 'python-setuptools')
depends=('python' 'python-dateutil')
optdepends=('python-pyqt5: for Qt GUI')
options=(!emptydirs)
source=("https://pypi.io/packages/source/${_pyname:0:1}/${_pyname}/${_pyname}-${pkgver}.tar.gz")
md5sums=('2801e4b6a29b8bf8c64669d8703bd3dc')

package() {
  cd "${srcdir}/${_pyname}-${pkgver}"
  python3 setup.py install --root="${pkgdir}/" --optimize=1
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
