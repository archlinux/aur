# Maintainer: Arti Zirk <arti.zirk@gmail.com>

pkgname=rauc
pkgver=1.2
pkgrel=1
pkgdesc="RAUC controls the update process on embedded linux systems. It is both a target application that runs as an update client and a host/target tool that allows you to create, inspect and modify installation artifacts."
arch=('i686' 'x86_64')
url="https://github.com/rauc/rauc"
license=('GPL')
depends=('curl' 'json-glib')
makedepends=('python')
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz
        https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz.asc)
sha256sums=('224683fc1fac50ccb89128aa786445cd8e26bb25deafd4410e0807187376e661'
            'SKIP')
validpgpkeys=('977843FD5C3EBF76BAD4008EA58CC53DBF05E090')

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
