# Maintainer: Mark J. Skinner <marks@cinfinity.info>
pkgname=std3d
pkgver=0.2
pkgrel=1
pkgdesc="A 3d graphics editor and game engine."
arch=('x86_64')
url="https://www.cinfinity.info/"
license=('GPL2')
depends=(zlib gtk2 libgl gtkglext freetype2 bullet alsa-lib libvorbis libmad imagemagick stdconfig)
provides=()
source=("https://www.cinfinity.info/src/${pkgname}_$pkgver.tar.xz" "https://www.cinfinity.info/src/${pkgname}_$pkgver.tar.xz.sig")
sha256sums=('4d53a656ac7f09d1089ec8d1cfe49609240200528d6453a00bae11f1de8cf1c4'
            'SKIP')
validpgpkeys=('337DBBBAB93B197BE445AF267EEF69820728EB48')

build() {
  cd "${pkgname}_$pkgver"

  ./configure --prefix=/usr --with-imagemagick
  make
}

package() {
  cd "${pkgname}_$pkgver"

  make DESTDIR="$pkgdir/" install
}
