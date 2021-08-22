# Maintainer: Roberto Anic Banic <nicba1010@gmail.com>
# Contributor: Doug Newgard <scimmia at archlinux dot info>
# Contributor: Lorenzo Ferrillo <lorenzofersteam at live dot it>

_python=python2
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.25.0
pkgrel=1
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('efl>=1.25.0' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.xz")
sha256sums=('99e06df773647acfb8e04786d6958bee5b8deae41d996ccaa68d7cca7b30612e')
sha512sums=('23ed29add25cd2639e9eb144f22c5e2809b8634389f7ab5c4b7ebc19302fde4ebb0fe8c41d7b10923e658676c4dfbb8670fda16675682fd376258beecbc3d9c3')

build() {
  cd $_pkgname-$pkgver

  $_python setup.py build
}

package() {
  cd $_pkgname-$pkgver

  $_python setup.py install --root="$pkgdir" --optimize=1

  install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" AUTHORS README ChangeLog
}
