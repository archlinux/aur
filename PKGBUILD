# Maintainer: Florian Schweikert <aur@ist-total.org>
pkgname=sndcut
pkgver=1.0
pkgrel=1
pkgdesc="Let's you generated LPs that you can laser cut from audio files.
 sndcut is a program the generates LP records from audio files - it generates a SVG file that you can laser cut."
arch=('x86' 'x86_64')
url="https://github.com/kallaballa/sndcut"
license=('GPL2')
depends=('libsndfile' 'libsamplerate' 'boost-libs')
makedepends=('boost')
source=(https://github.com/kallaballa/$pkgname/archive/v$pkgver.zip)
sha1sums=('162f8191e81e374742be6e9117f8a9c97f29bfdf')

build() {
  cd $pkgname-$pkgver
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir/" install
}
