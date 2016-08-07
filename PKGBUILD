# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Peter Johansson <zeronightfall at gmail dot com>

pkgname=starfighter
pkgver=1.6
pkgrel=1
pkgdesc="Side-scrolling shoot 'em up space game"
arch=('i686' 'x86_64')
url="http://starfighter.nongnu.org"
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
source=(http://download.savannah.gnu.org/releases/$pkgname/${pkgver:0:3}/$pkgname-$pkgver-src.tar.gz)
md5sums=('6abd08149594357c170da1d73f0099d7')

build() {
  cd $pkgname-$pkgver-src
  make DATADIR=/usr/share/starfighter/
}

package() {
  cd $pkgname-$pkgver-src
  make BINDIR=/usr/bin/ DATADIR=/usr/share/starfighter/ DESTDIR=$pkgdir install
}
