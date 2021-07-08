# Maintainer: Andy Alt <andy400-dev at yahoo dot com>

pkgname=canfigger
pkgver=0.1.1
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
sha256sums=('e497111b96d8c66f105cdec9382a48fe73f9c87d7e653b29a7e5c8658ef239e7')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
