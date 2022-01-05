# Maintainer: Andy Alt <andy400-dev at yahoo dot com>

pkgname=canfigger
pkgver=0.2.0
pkgrel=1
pkgdesc="simple configuration file parser library"
arch=('i686' 'x86_64' 'aarch64' 'armv7h' 'ppc64le')
url="https://github.com/andy5995/canfigger"
license=('GPL3')
depends=('glibc')
makedepends=('meson' 'ninja')
provides=('canfigger' 'libcanfigger.so')
options=('staticlibs')

source=("https://github.com/andy5995/${pkgname}/releases/download/v${pkgver}/${pkgname}-${pkgver}.tar.xz")
sha256sums=('c43449d5f99f4a5255800c8c521e3eaec7490b08fc4363f2858ba45c565a1d23')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
