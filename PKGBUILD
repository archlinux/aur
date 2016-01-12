# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Peter Johansson <zeronightfall at gmail dot com>

pkgname=starfighter
pkgver=1.5
pkgrel=1
pkgdesc="Side-scrolling shoot 'em up space game"
arch=('i686' 'x86_64')
url="http://starfighter.nongnu.org"
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
source=(http://download.savannah.gnu.org/releases/$pkgname/$pkgver/$pkgname-$pkgver-src.tar.gz)
md5sums=('dcfe7156a3a710628fb74ca3dc8435dc')

build() {
  cd $pkgname-$pkgver-src
  make BINDIR=/usr/bin/ DATADIR=/usr/share/parallelrealities/
}

package() {
  cd $pkgname-$pkgver-src
  make BINDIR=/usr/bin/ DATADIR=/usr/share/parallelrealities/ DESTDIR=$pkgdir install
  
  install -Dm644 misc/$pkgname.png $pkgdir/usr/share/pixmaps/$pkgname.png
  install -Dm644 misc/$pkgname.desktop $pkgdir/usr/share/applications/$pkgname.desktop
}
