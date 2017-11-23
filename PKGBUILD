# Maintainer: Daniel Maslowski <info@orangecms.org>

_pyname=conda-verify
pkgname=python-${_pyname}
pkgver=3.0.1
pkgrel=1
pkgdesc="Verify conda recipes and packages"
arch=('any')
url="https://github.com/conda/conda-verify"
license=('BSD')
depends=('python' 'python-conda')
options=(!emptydirs)
install=
source=(https://github.com/conda/$_pyname/archive/$pkgver.tar.gz)
sha512sums=('dad87d089c087374bc088913168fe1c1da50155ae43dacdbba0125b71a42d0b90236a20868e1962c10a662c48f5296ea15af6201c421039e755d4bff7b140adf')

package() {
  cd "$srcdir/${_pyname}-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -Dm 644 LICENSE.txt "$pkgdir/usr/share/licenses/${pkgname}/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
