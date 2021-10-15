# Maintainer: George Rawlinson <george@rawlinson.net.nz>
# Contributor: Michael Straube <straubem@gmx.de>

pkgname=doomretro
pkgver=4.3
pkgrel=1
pkgdesc='The classic, refined DOOM source port'
arch=('x86_64' 'aarch64')
url='http://doomretro.com'
license=('GPL3')
depends=('sdl2_image' 'sdl2_mixer' 'glibc')
makedepends=('cmake')
optdepends=('timidity++: for music playback')
source=("$pkgname-$pkgver.tar.gz::https://github.com/bradharding/doomretro/archive/v$pkgver.tar.gz")
sha512sums=('1fa2357e3ba8cbceafd3e372b3d6943238e8cd9174053d82e5b84b8b470e1057bf3a34d0dfef9552dcaf020250b4a7f9cf768aa754501a58a3221988d198ef06')
b2sums=('c1e254c91bce53b364b197fb77867e546ec85d3763f25f4eaeac8a0935c6d1f43529952c39fcbf79ba2db4d4f15c5ac67383fab0dcde1f214f96b4915cc70317')

build() {
  cmake \
    -B build \
    -S "$pkgname-$pkgver" \
    -DCMAKE_INSTALL_PREFIX=/usr
  make -C build
}

package() {
  make -C build DESTDIR="$pkgdir" install
}
