# Maintainer: Baptiste Jonglez <baptiste--aur at jonglez dot org>
pkgname=i2util
_pkgname=I2util
pkgver=1.2
pkgrel=1
pkgdesc="Internet2 utility tools"
arch=("i686" "x86_64")
url="https://software.internet2.edu/"
license=('Apache')
depends=("glibc")
source=("https://software.internet2.edu/sources/$_pkgname/$_pkgname-$pkgver.tar.gz")
md5sums=('08762c549e63a8102bfa9fe9a0f09c5f')

build() {
  cd "$srcdir/$_pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$_pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
