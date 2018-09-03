# Maintainer: Doug Newgard <scimmia at archlinux dot info>
# Mantainer: Lorenzo Ferrillo <lorenzofersteam at live dot it>
_python=python
_pkgname=python-efl
pkgname=$_python-efl
pkgver=1.21.0
pkgrel=1
pkgdesc="${_python^} bindings for the Enlightenment Foundation Libraries"
arch=('i686' 'x86_64')
url="http://www.enlightenment.org"
license=('LGPL3' 'GPL3')
depends=('efl>=1.21.0' "$_python-dbus")
source=("http://download.enlightenment.org/rel/bindings/python/$_pkgname-$pkgver.tar.xz")
sha256sums=('87e04b345528c173e6bea124e48b742e88ae3207458470062300380bd166a223')
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
