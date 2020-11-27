# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mark Coolen <mark.coolen@gmail.com>
# Maintainer: SanskritFritz (gmail)

pkgname=berusky2
pkgver=0.12
pkgrel=1
pkgdesc="A logic game based on the puzzle game Sokoban."
arch=('i686' 'x86_64')
url="https://www.anakreon.cz/berusky2.html"
license=('GPL')
depends=('glu' 'libvorbis' 'freealut' 'sdl_image' 'berusky2-data')
source=("https://www.anakreon.cz/download/berusky2-$pkgver.tar.gz")
md5sums=('d36eff2369279bf16546c4e20c1a379a')

build() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  ./configure --prefix=/usr --with-ini-file-global-dir=\"/usr/share/berusky2\"
  make
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir" install
  mv "$pkgdir/usr/doc" "$pkgdir/usr/share/"

  install -m644 -D "$srcdir"/$pkgname-$pkgver/data/berusky2.png "$pkgdir"/usr/share/pixmaps/berusky2.png
  install -m644 -D "$srcdir"/$pkgname-$pkgver/data//berusky2.desktop "$pkgdir"/usr/share/applications/berusky2.desktop
}
