# Maintainer: Feufochmar <feufochmar.gd@gmail.com>
pkgname=brickshooter
pkgver=0.04
pkgrel=2
pkgdesc="A small puzzle game where you'll have to clear the central area from blocks."
arch=('i686' 'x86_64')
url="http://linux.softpedia.com/get/GAMES-ENTERTAINMENT/Puzzle/brickshooter-37619.shtml"
license=('GPL')
depends=('sdl' 'sdl_mixer' 'sdl_image')
source=("http://mirror.amdmi3.ru/distfiles/$pkgname-$pkgver.tar.gz"
        'brickshooter'
        'brickshooter.desktop'
	'brickshooter.png')

build() {
  cd "$srcdir/$pkgname-$pkgver"
  make
}

package() {
  # There is no "make install" in the makefile...
  cd "$srcdir/$pkgname-$pkgver"
  install -d "$pkgdir/usr/share/brickshooter/"{gfx,levels,snd}
  install -d "$pkgdir/usr/bin" "$pkgdir/usr/share/applications" "$pkgdir/usr/share/pixmaps"
  install -m 755 brickshooter "$pkgdir/usr/share/brickshooter"
  install -m 644 gfx/* "$pkgdir/usr/share/brickshooter/gfx"
  install -m 644 levels/* "$pkgdir/usr/share/brickshooter/levels"
  install -m 644 snd/* "$pkgdir/usr/share/brickshooter/snd"
  cd "$srcdir"
  install -m 755 brickshooter "$pkgdir/usr/bin"
  install -m 644 brickshooter.desktop "$pkgdir/usr/share/applications"
  install -m 644 brickshooter.png "$pkgdir/usr/share/pixmaps"
}
md5sums=('9b2308e44591917b8d1f0b0382b7e878'
         '2cc6383a4dec9ef7ca40a8c09d27bea8'
         'fccfdb36a7499184849a86410e9b3a46'
         'd3ad3f00689b0422c6db3ef9359c1acc')
