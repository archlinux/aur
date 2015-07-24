# Contributor: Andrea Scarpino <andrea@archlinux.org>
# Contributor: Mark Coolen <mark.coolen@gmail.com>

pkgname=berusky2
pkgver=0.10
pkgrel=1
pkgdesc="A logic game based on the puzzle game Sokoban"
arch=('i686' 'x86_64')
url="http://www.anakreon.cz/en/"
license=('GPL')
depends=('sdl_image' 'mesa' 'berusky2-data')
source=("http://downloads.sourceforge.net/project/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
md5sums=('3c2d5217f7a61a6fbc13d689b88ec4e4')

build() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  ./configure --prefix=/usr --docdir=/usr/share/doc/"$pkgname" \
 --with-ini-file-global-dir=\"/usr/share/berusky2\"
  make
}

package() {
  cd "$srcdir"/"$pkgname"-"$pkgver"
  make DESTDIR="$pkgdir" install
  #chmod "$pkgdir"/usr/share/berusky2/berusky3d-local.ini
    
  install -m644 -D "$srcdir"/$pkgname-$pkgver/data/berusky2.png "$pkgdir"/usr/share/pixmaps/berusky2.png
  install -m644 -D "$srcdir"/$pkgname-$pkgver/data//berusky2.desktop "$pkgdir"/usr/share/applications/berusky2.desktop
}
