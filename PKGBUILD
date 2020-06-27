# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-verify
pkgname=python-${_pyname}
pkgver=3.4.2
pkgrel=2
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
sha512sums=('8bdbb4d45982d5bc31995016a4b180a4288753c7d811de26d3841a114c35404041b27f5a06288866716404a45134a2bc3ac0e8d0c8bf6a1e36363c2b3f326d65')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
