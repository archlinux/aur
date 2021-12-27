# Maintainer: Andy Alt <andy400-dev at yahoo dot com>

pkgname=canfigger
pkgver=0.1.2
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
sha256sums=('0ad25da1ca70b3e0e3d6d15ccddd47898f777cf7adeeb7f98dbe9c909f51f6d2')

build() {
  arch-meson $pkgname-$pkgver build
  meson compile -C build
}

package() {
  DESTDIR="$pkgdir" meson install -C build
}
