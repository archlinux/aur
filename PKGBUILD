# Maintainer: Essem <smswessem at gmail dot com>
# Maintainer: grimi <grimi at poczta dot fm>

pkgname=uade-quad
pkgver=2.13q
pkgrel=2
pkgdesc="Amiga music player with multichannel patch"
arch=('i686' 'x86_64')
url="https://blog.airmann.de/uade-multichannel-audio-support/"
license=('GPL')
depends=('libao' 'fuse')
makedepends=('pkg-config')
provides=('uade123' 'uadefs' 'mod2ogg2.sh')
install=uade.install
source=("http://blog.airmann.de/wp-content/uploads/2013/08/uade_$pkgver.tar.bz2")
md5sums=('612002d4a749f4292d7813b8e400f265')

build() {
  cd uade-$pkgver
  ./configure --prefix=/usr --package-prefix="$pkgdir" --without-audacious
  make
}

package() {
  cd uade-$pkgver
  make install
}


