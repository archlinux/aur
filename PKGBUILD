# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=python-tappy
_prjname=tap.py
pkgver=2.1
pkgrel=1
pkgdesc="Test Anything Protocol (TAP) tools for Python"
arch=(any)
url="https://pypi.python.org/pypi/tap.py"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=(https://files.pythonhosted.org/packages/source/t/${_prjname}/${_prjname}-${pkgver}.tar.gz)
md5sums=('0a21cc983235e8cb526b2772dd216076')
sha256sums=('3b03e72ec9f0f081290a8e855888526f07dbec4eb986420ce7d9733aa22aafe8')

package() {
  cd "$srcdir/$_prjname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
