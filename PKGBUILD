# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=cryptop
pkgname=$_name
pkgver=0.2.0
pkgrel=1
pkgdesc="command line crypto portfolio"
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python' 'python-requests' 'python-requests-cache')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('57e120ac27549ba9037fba86c16fc508fed481d0ddfd3e63a2b2692e53a20247fdb897e485ce198897d7b92c9e9bd381cb9b90dbe58ddaab15571f188198221a')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
