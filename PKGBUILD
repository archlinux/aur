# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
pkgname=flipclock
pkgver=2.6.1
pkgrel=1
pkgdesc="A flip clock screensaver supported by SDL2."
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/AlynxZhou/flipclock"
license=('Apache')
depends=('sdl2' 'sdl2_ttf')
makedepends=('meson')
source=("https://github.com/AlynxZhou/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('6449c80f0d151bb22bcd92ed410d276c2234d9433d36212b5cac003df66e3730f1a73e13d8787ba7f84879100b1636d68d52b548a7827b5cbe8476a0c3833d0e')

prepare() {
  mkdir -p build
}

build() {
  cd build
  arch-meson . "../${pkgname}-${pkgver}"
  meson compile
}

package() {
  cd build
  DESTDIR="${pkgdir}" meson install
}
