# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Mantainer: Lorenzo Ferrillo <lorenzofersteam at live dot it>
# Maintainer: Philippe Bourjac <philippe dot bourjac at gmail dot com>
_python=python
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.26.1
pkgrel=2
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('efl>=1.26.3' "$_python-dbus" "python-setuptools")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.xz")
sha256sums=('dcdb397e12078a19e90d80e7c6f3cfd3458864bfe8d5458bce0368b6de0628d7')
#sha256sums=('SKIP')
build() {
  cd $_pkgname-$pkgver

  $_python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  $_python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS README.md ChangeLog
}
