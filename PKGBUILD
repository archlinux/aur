# Maintainer: carstene1ns <arch carsten-teibes de> - http://git.io/ctPKG
# Contributor: Peter Richard Lewis <plewis@aur.archlinux.org>
# Contributor: Gadget3000 <gadget3000 at msn dot com>

pkgname=freesynd
pkgver=0.7.1
pkgrel=1
pkgdesc="A free, cross-platform reimplementation of the classic Bullfrog game 'Syndicate'"
url="http://freesynd.sourceforge.net/"
license=('GPL2')
arch=('i686' 'x86_64')
depends=('sdl_mixer' 'sdl_image')
makedepends=('cmake')
source=("http://sourceforge.net/projects/$pkgname/files/$pkgname/$pkgname-$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('e55b0b3386cdace81fdcd8e33943535abf19ba0797b78c404689bcdd2c55f7de')

prepare() {
  cd $pkgname-$pkgver

  rm -rf build
  mkdir build
}

build() {
  cd $pkgname-$pkgver/build

  cmake .. -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
  make
}

package () {
  make -C $pkgname-$pkgver/build DESTDIR="$pkgdir/" install
}
