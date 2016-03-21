# Maintainer: Wilhelm Schuster <wilhelm [aT] wilhelm [.] re>
# Contributor: AlexanderR <alexander r at gmx com>
# Contributor: Eric Forgeot < http://ifiction.free.fr >
pkgname=fizmo
pkgver=0.7.10
pkgrel=1
pkgdesc="A Z-Machine interpreter supporting unicode, sound, blorbfile and more."
arch=('i686' 'x86_64')
url="https://christoph-ender.de/fizmo/"
license=('BSD')
depends=('libxml2' 'libsndfile' 'libjpeg-turbo' 'libpng' 'sdl2')
groups=('inform')
source=("https://christoph-ender.de/fizmo/source/$pkgname-$pkgver.tar.gz")
sha256sums=('0e3561492ece58ff60eba768f3b2cfa943ba111736b0f63b775e3face590462b')

build() {
  cd $pkgname-$pkgver

  ./configure --prefix=/usr
  make
}

package() {
  cd $pkgname-$pkgver

  make DESTDIR="$pkgdir" install
  install -Dm644 COPYRIGHT.txt "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

