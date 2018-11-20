# Maintainer: Daniel M. Capella <polycitizen@gmail.com>

pkgname=pcaudiolib
pkgver=1.1
pkgrel=1
pkgdesc='Portable C Audio Library'
url=https://github.com/espeak-ng/pcaudiolib
arch=('x86_64')
license=('GPL3')
depends=('alsa-lib' 'libpulse')
source=("$url/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha512sums=('d503c11b355601e1e05f0f438a0cd9ce277d19fd53d3f7edf26f6e17f1f8184e8b2112a282e8ed74db8646bb5534d2a9a3c707b1742ce02ef13fd89669785007')

prepare() {
  cd $pkgname-$pkgver
  ./autogen.sh
}

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
