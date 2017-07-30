# Maintainer: Luca Weiss <luca (at) z3ntu (dot) xyz>

_name=cryptop
pkgname=$_name
pkgver=0.1.0
pkgrel=1
pkgdesc="Easy terminal colors, with chainable methods."
arch=('any')
url="https://pypi.python.org/pypi/$_name/"
license=('MIT')
depends=('python')
options=(!emptydirs)
source=("https://files.pythonhosted.org/packages/source/${_name::1}/${_name}/${_name}-${pkgver}.tar.gz")
sha512sums=('3e6db0bae16754274a40ff83528837276d1166a4d94db1c4d79ea40c778deb7faa95102f9285e082e0943da18957043f3cb8cd491b6d1cad52afd0eca8bf1e22')

package() {
  cd "$srcdir/$_name-$pkgver"
  python setup.py install --root="$pkgdir/" --optimize=1

  install -Dm644 "LICENSE.txt" "$pkgdir/usr/share/licenses/$pkgname/LICENSE.txt"
}

# vim:set ts=2 sw=2 et:
