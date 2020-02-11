# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Mantainer: Lorenzo Ferrillo <lorenzofersteam at live dot it>
# Maintainer: Philippe Bourjac <philippe dot bourjac at gmail dot com>
_python=python
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.23.0
pkgrel=1
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('efl>=1.23.0' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.xz")
sha256sums=('2bdef4153e3df2ed3edef9f1ebb4554054405425247a9fabb3c784b48232d69b')
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
