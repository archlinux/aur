# Maintainer: Felix Barz <skycoder42.de@gmx.de>
pkgname=python-doxyqml
pkgver=0.4.0
pkgrel=1
pkgdesc="Doxyqml turns .qml into pseudo-C++ which Doxygen can then use to generate documentation."
arch=('any')
url="https://github.com/agateau/doxyqml"
license=('BSD')
depends=('python' 'doxygen')
_pkgfqn=$pkgname-$pkgver
source=("$_pkgfqn::git+https://github.com/agateau/doxyqml.git#tag=$pkgver")
sha256sums=('SKIP')

package() {
  cd "$srcdir/$_pkgfqn"
  python setup.py install --root="$pkgdir/" --optimize=1
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
