# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-verify
pkgname=python-${_pyname}
pkgver=3.4.2
pkgrel=1
pkgdesc="Verify conda recipes and packages"
arch=('any')
url="https://github.com/conda/conda-verify"
license=('BSD')
depends=(
  'python'
  'python-conda'
  'python-click'
  'python-future'
  'python-jinja'
  'python-yaml'
)
options=(!emptydirs)
install=
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('f70e2d372f241ba6e8104be774e5d7391395ddc856bcbcadcf68763f1ab61725f6840f50f18d1bffa84b6ee9ac1cf1ff5019d95a042cd5a87d64bf9a7d7bec4c')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
