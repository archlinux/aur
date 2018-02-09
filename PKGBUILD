# Maintainer: Arti Zirk <arti.zirk@gmail.com>

pkgname=rauc
pkgver=0.3
pkgrel=1
pkgdesc="RAUC controls the update process on embedded linux systems. It is both a target application that runs as an update client and a host/target tool that allows you to create, inspect and modify installation artifacts."
arch=('i686' 'x86_64')
url="https://github.com/rauc/rauc"
license=('GPL')
depends=('curl' 'json-glib')
makedepends=('python')
source=(https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz)
#        https://github.com/$pkgname/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.xz.asc)
sha256sums=('dc01bfb08b1830376782f9a51cfec290171519267ab97cc909435da9ac6d6d98')
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
