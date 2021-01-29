# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
pkgname=flipclock
pkgver=2.6.0
pkgrel=1
pkgdesc="A flip clock screensaver supported by SDL2."
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/AlynxZhou/flipclock"
license=('Apache')
depends=('sdl2' 'sdl2_ttf')
makedepends=('meson')
source=("https://github.com/AlynxZhou/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('23bca4767b1cf01624aa1ddc89dffda7981ffcdf57b1823b819b043d23ffa2a4ac4b60567c432a3e7f25d39b90016797946fa02e365cedb6670ed46caabe9730')

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
  DESTDIR="${pkgdir}/" meson install
}
