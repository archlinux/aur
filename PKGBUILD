# Maintainer: Steffen Weber <-boenki-gmx-de->
# Contributor: jsteel <mail at jsteel dot org>
# Contributor: Anton Bazhenov <anton.bazhenov at gmail>
# Contributor: Arkham <arkham at archlinux dot us>
# Contributor: Peter Johansson <zeronightfall at gmail dot com>

pkgname=starfighter
pkgver=2.1
pkgrel=1
pkgdesc="Side-scrolling shoot 'em up space game"
arch=('x86_64')
url="https://pr-starfighter.github.io/"
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer')
source=($pkgname-$pkgver.tar.gz::https://github.com/pr-starfighter/$pkgname/releases/download/v${pkgver}/$pkgname-${pkgver:0:3}-src.tar.gz)
md5sums=('b2dc59a9a28389e8c7a14d3a83d946e8')

build() {
  cd $pkgname-${pkgver:0:3}-src
  ./configure exec_prefix=/usr prefix=/usr
  make 
}

package() {
  cd $pkgname-${pkgver:0:3}-src
  make DESTDIR="$pkgdir" install
}
