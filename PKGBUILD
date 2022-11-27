# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Based on Artiom Molchanov PKGBUILD for lpairs found on AUR archive

pkgname=lpairs2
pkgver=2.2
pkgrel=1
pkgdesc="A classical memory game"
arch=(x86_64 i686)
url="http://lgames.sourceforge.net/LPairs/"
license=('GPL3')
depends=("sdl2" "sdl2_ttf" "sdl2_image" "sdl2_mixer")
source=(http://prdownloads.sourceforge.net/lgames/$pkgname-$pkgver.tar.gz)
sha256sums=('b307bf701f51ab11d23524a18abc89f177f0664d97eaa203c455116f034e779f')


build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr
  make 
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
}

