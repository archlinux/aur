# Maintainer: Arti Zirk <arti.zirk@gmail.com>

pkgname=rauc
pkgver=0.1
pkgrel=1
pkgdesc="RAUC controls the update process on embedded linux systems. It is both a target application that runs as an update client and a host/target tool that allows you to create, inspect and modify installation artifacts."
arch=('i686' 'x86_64')
url="https://github.com/rauc/rauc"
license=('GPL')
depends=('curl' 'json-glib')
makedepends=('python')
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz)
#        https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz.asc)
md5sums=('33c6f45b71f9b9c082fa852c3d5915d9')
#         'SKIP')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/$pkgname-$pkgver
  make DESTDIR=$pkgdir install
}
# vim:syntax=sh
