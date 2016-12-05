# Maintainer: Michael Straube <straubem gmx de>
# Contributor: archtux <antonio.arias99999@gmail.com>

pkgname=sdlhana
pkgver=0.34
pkgrel=3
pkgdesc="SDL-based Hanafuda game"
arch=('i686' 'x86_64')
url="http://sdlhana.nongnu.org"
license=('GPL')
depends=('sdl' 'gcc-libs')
source=("https://nongnu.uib.no/$pkgname/$pkgname-$pkgver.tar.bz2"
        "sdlhana.desktop")
sha1sums=('f6ce75fa8025795321fc1ca757f44a03ba1ca5e6'
          '0182bd532b6a8d9ebc3237b5ebb82a46f1ec270b')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install

  install -Dm644 ../sdlhana.desktop "$pkgdir"/usr/share/applications/sdlhana.desktop
  install -Dm644 src/sdlhana.xpm "$pkgdir"/usr/share/pixmaps/sdlhana.xpm
}
