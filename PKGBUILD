# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

_python=python
pkgname=$_python-efl
_pkgname=python-efl
pkgver=1.8.0
pkgrel=1
pkgdesc="$_python bindings for the Enlightenment Foundataion Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('elementary>=1.8.0' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.gz")
sha256sums=('8f883c325e30ee3eb2fa38822fa353a22207441b385f4e167cf9c1cf855638f7')

build() {
  cd "$srcdir/$_pkgname-$pkgver"

  $_python setup.py build
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"

  $_python setup.py install --root="$pkgdir"

# install text files
  install -Dm644 AUTHORS "$pkgdir/usr/share/doc/$pkgname/AUTHORS"
  install -Dm644 README "$pkgdir/usr/share/doc/$pkgname/README"
  install -Dm644 changes.html "$pkgdir/usr/share/doc/$pkgname/changes.html"
}
