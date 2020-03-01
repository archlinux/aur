# Maintainer: Alynx Zhou <alynx.zhou@gmail.com>
pkgname=flipclock
pkgver=2.3.6
pkgrel=1
pkgdesc="A flip clock screensaver supported by SDL2."
arch=('x86_64' 'i686' 'aarch64' 'armv7h' 'armv6h')
url="https://github.com/AlynxZhou/flipclock"
license=('GPL')
depends=('sdl2' 'sdl2_ttf')
makedepends=('cmake')
source=("https://github.com/AlynxZhou/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('257af1720fd59cd39935543af3d681ceb2478dfc40f902ff40fd73fb3f18ca88150052b812c6ff324faf98149c68262ee79f55f515b6cba335b0fb1d8e9848f0')

build() {
  cd "${pkgname}-${pkgver}"
  mkdir -p build
  cd build
  cmake -DCMAKE_INSTALL_PREFIX=/usr ..
  make
}

package() {
  cd "${pkgname}-${pkgver}"
  cd build
  make DESTDIR="${pkgdir}/" install
}
