# Maintainer: Doug Newgard <scimmia22 at outlook dot com>

_python=python
pkgname=$_python-efl
_pkgname=python-efl
pkgver=1.9.0
pkgrel=2
pkgdesc="$_python bindings for the Enlightenment Foundataion Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('elementary' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.bz2")
sha1sums=('377eb29fd291aa499b6560851b34c8bd90ae8ad8')

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
