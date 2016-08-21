# Maintainer: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
# Contributor: AlexanderR <alexander r at gmx com>
# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=fizmo
pkgver=0.8.0
pkgrel=1
pkgdesc="A Z-Machine interpreter supporting unicode, sound, blorbfile and more."
arch=('i686' 'x86_64')
url=" https://fizmo.spellbreaker.org/"
license=('BSD')
depends=('ncurses' 'freetype2' 'libxml2' 'libsndfile' 'libjpeg-turbo' 'libpng' 'sdl2')
groups=('inform')
source=("https://fizmo.spellbreaker.org/source/$pkgname-$pkgver.tar.gz")
sha256sums=('2aeeee5cf6d5e0ce16d9c1c205a4a671315e68944c71d5ac49ab326415fc1a96')

build() {
  cd $pkgname-$pkgver

  ./configure \
      --prefix=/usr \
      --disable-x11
  make -j1
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

