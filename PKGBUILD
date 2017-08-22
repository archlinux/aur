# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=cryptop
pkgname=$_name
pkgver=0.1.9
pkgrel=1
pkgdesc="command line crypto portfolio"
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python' 'python-requests' 'python-requests-cache')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('081c86945582ea1e17c043cfae7e9b806c88303f8ade92666e952f23113a04837ad51d5379c0c9bd196902ed72023b47b1ccaa4e539386c8a3518a92cc6c49e4')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
