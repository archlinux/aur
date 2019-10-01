# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Mantainer: Lorenzo Ferrillo <lorenzofersteam at live dot it>
_python=python
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.22.0
pkgrel=1
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('efl>=1.22.0' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.xz")
sha256sums=('c368c0621ddcaf0badd4998101621421afee2109bf5c2bfaec4b6837d8301ee2')
#sha256sums=('SKIP')
build() {
  cd $_pkgname-$pkgver

  $_python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  $_python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS README ChangeLog
}
