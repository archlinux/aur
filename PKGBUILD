# $Id: PKGBUILD 59656 2011-11-29 08:40:05Z arodseth $
# Maintainer: Alexander Rødseth
# Contributor: Biru Ionut <ionut@archlinux.ro>
# Contributor: Jeff Mickey <jeff@archlinux.org>
pkgname=iat
pkgver=0.1.7
pkgrel=4
pkgdesc="Detects and converts DVD/CD images from BIN/MDF/PDI/CDI/NRG/B5I to ISO-9660"
arch=('x86_64' 'i686')
url="http://iat.berlios.de/"
license=('GPL')
depends=('glibc')
#source=("http://download.berlios.de/$pkgname/$pkgname-$pkgver.tar.bz2")
source=("http://www.mirrorservice.org/sites/download.sourceforge.net/pub/sourceforge/i/project/ia/iat.berlios/iat-$pkgver.tar.bz2")
md5sums=('5e1ffd82000ea4c80ffb2d63ae55120c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr --includedir="/usr/include/$pkgname"
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
