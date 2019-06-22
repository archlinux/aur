# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=python-tappy
_prjname=tap.py
pkgver=2.5
pkgrel=1
pkgdesc="Test Anything Protocol (TAP) tools for Python"
arch=(any)
url="https://pypi.python.org/pypi/tap.py"
license=('BSD')
depends=('python' 'python-babel' 'python-pyaml' 'python-more-itertools')
makedepends=('python-mock')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/source/t/${_prjname}/${_prjname}-${pkgver}.tar.gz)
md5sums=('774f543b6138320dfd737a1982fb149c')
sha256sums=('8ad62ba6898fcef4913c67d468d0c4beae3109b74c03363538145e31b1840b29')

check() {
  cd "$_prjname-$pkgver"
  python setup.py test
}

package() {
  cd "$_prjname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}


# vim:set ts=2 sw=2 et:
