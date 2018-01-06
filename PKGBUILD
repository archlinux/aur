# Maintainer: Ray Rashif <schiv@archlinux.org>

pkgname=rakarrack
pkgver=0.6.1
pkgrel=3
pkgdesc="Versatile guitar multi-effects processor"
arch=('x86_64')
license=('GPL')
url="http://rakarrack.sourceforge.net"
depends=('alsa-utils' 'jack' 'fltk' 'libxpm')
source=("http://downloads.sourceforge.net/$pkgname/$pkgname-$pkgver.tar.bz2"
        'fltk_include.patch')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"

  # fix for latest fltk include dir name
  patch -Np1 -i "$srcdir/fltk_include.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
md5sums=('56b1e04779ae3d56cc8a3ad3c4e25152'
         'd43512466f514434daaf16bd72951ea0')
