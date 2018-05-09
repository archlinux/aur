# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-verify
pkgname=python-${_pyname}
pkgver=3.0.2
pkgrel=1
pkgdesc="Verify conda recipes and packages"
arch=('any')
url="https://github.com/conda/conda-verify"
license=('BSD')
depends=('python' 'python-conda')
options=(!emptydirs)
install=
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('1796c6f31e5247853870291ac93ec6aa2a824e903286143035d024af832ffa6cb0c54d08c1bd04796ae402efaae3e0329fa2f4f749d576e11cbd008b026c2ad6')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
