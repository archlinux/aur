# Maintainer: Andrew Lin <andrewlin16@gmail.com>

pkgname=vgmplay
pkgver=0.40.9
pkgrel=1
pkgdesc="The offical and always up-to-date player for all VGM files"
arch=('i686' 'x86_64')
url="http://vgmrips.net/forum/viewtopic.php?t=112"
license=('GPL' 'custom')
source=("https://github.com/vgmrips/vgmplay/archive/$pkgver.tar.gz")
depends=('libao' 'zlib')
md5sums=('a2217e465c5e3bdebc47dbb15a6cb436')

build() {
  cd "$pkgname-$pkgver/VGMPlay"
  make
}

package() {
  cd "$pkgname-$pkgver/VGMPlay"
  mkdir -m 755 -p "$pkgdir/usr/bin" "$pkgdir/usr/share/man/man1"
  make PREFIX=/usr DESTDIR="$pkgdir" install
  make PREFIX=/usr DESTDIR="$pkgdir" play_install
  mkdir -m 755 -p "$pkgdir/usr/share/licenses/vgmplay"
  cp licenses/* "$pkgdir/usr/share/licenses/vgmplay"
}

# vim:set ts=2 sw=2 et:
