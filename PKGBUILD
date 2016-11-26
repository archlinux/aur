# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-verify
pkgname=python-${_pyname}
pkgver=2.0.0
pkgrel=1
pkgdesc="Verify conda recipes and packages"
arch=('any')
url="https://github.com/conda/conda-verify"
license=('BSD')
depends=('python' 'python-conda')
options=(!emptydirs)
install=
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('f0b78234c9f2384b9af09c52793aeb2f89c05a71f653c1beab1ffa2488a1a2b639d6f3e9a2dd77fdb7e4b6f0e4302633989abe2e430ff753eb25935cfe4eb5d3')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
