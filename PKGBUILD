# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Peter Johansson <zeronightfall at gmail dot com>

pkgname=starfighter
pkgver=2.4
pkgrel=1
pkgdesc="Side-scrolling shoot 'em up space game"
arch=('x86_64')
url="https://pr-starfighter.github.io/"
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
source=($pkgname-$pkgver.tar.gz::https://github.com/pr-starfighter/$pkgname/releases/download/v${pkgver}/$pkgname-$pkgver-src.tar.gz)
md5sums=('ab7d7c3d122225c19e5647792ba374bd')

build() {
  cd $pkgname-$pkgver-src
  ./configure exec_prefix=/usr prefix=/usr
  make 
}

package() {
  cd $pkgname-$pkgver-src
  make DESTDIR="$pkgdir" install
}
