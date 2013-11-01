# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

pkgname=python-efl
_pkgname=python-efl
pkgver=1.8.0
pkgrel=1
pkgdesc="Python bindings for the Enlightenment Foundataion Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3')
depends=('elementary' 'python-dbus')
source=("http://download.enlightenment.org/releases/BINDINGS/python/$_pkgname-$pkgver.tar.bz2")
sha256sums=('')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  python setup.py install --root="$pkgdir"

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
}
