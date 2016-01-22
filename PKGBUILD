# Maintainer: Patrick McCarty <pnorcks at gmail dot com>

pkgname=python-tappy
_prjname=tap.py
pkgver=1.8
pkgrel=1
pkgdesc="Test Anything Protocol (TAP) tools for Python"
arch=(any)
url="https://pypi.python.org/pypi/tap.py"
license=('BSD')
depends=('python')
options=(!emptydirs)
source=(https://pypi.python.org/packages/source/t/${_prjname}/${_prjname}-${pkgver}.tar.gz)
md5sums=('fa48198ddf0ac8f183c32d252b25e827')
sha256sums=('b2b325d159272e476e90eb1783de4436b70b62f59abbdecc42c9967fa92c5549')

package() {
  cd "$srcdir/$_prjname-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  mkdir -p "$pkgdir"/usr/share/licenses/$pkgname
  install -m644 LICENSE "$pkgdir"/usr/share/licenses/$pkgname/LICENSE
}

# vim:set ts=2 sw=2 et:
