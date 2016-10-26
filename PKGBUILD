# Maintainer: Kyle Keen <keenerd@gmail.com>
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
source=("http://downloads.sourceforge.net/project/iat.berlios/iat-$pkgver.tar.gz")
#md5sums=('5e1ffd82000ea4c80ffb2d63ae55120c')
md5sums=('af4526b497ddeb85f97f037f9bd7ae6b')  # not sure what changed...

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
