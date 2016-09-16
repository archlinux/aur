# Maintainer: PlusMinus

pkgname=evdi
pkgver=1.2.55
pkgrel=1
pkgdesc="A Linux® kernel module that enables management of multiple screens."
arch=('i686' 'x86_64')
url="https://github.com/DisplayLink/evdi"
license=('GPL')
groups=()
depends=(dkms)
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=$pkgname.install
changelog=$pkgname.Changelog
source=($pkgname-$pkgver.tar.gz::https://github.com/DisplayLink/evdi/archive/v$pkgver.tar.gz)
noextract=()
md5sums=('579889b974e3f1f889bf1dfa47190cea')

build() {
  cd "$pkgname-$pkgver"

  make
}

package() {
  cd "$pkgname-$pkgver"

  LIBNAME=lib$pkgname

  install -D -m 755 library/$LIBNAME.so $pkgdir/usr/lib/$LIBNAME/$LIBNAME.so
  install -D -m 755 module/*.o $pkgdir/usr/lib/$LIBNAME
  
  install -d $pkgdir/usr/include/$LIBNAME
  install -D -m 755 module/*.h $pkgdir/usr/include/$LIBNAME
}
