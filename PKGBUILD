# Maintainer: Lex Black <autumn-wind@web.de>

pkgname=louvre 
pkgver=1.1.0
pkgrel=1
pkgdesc="C++ library for building Wayland compositors"
arch=('x86_64')
url="https://github.com/CuarzoSoftware/Louvre"
license=('GPL3')
depends=('libsrm' 'wayland' 'libglvnd' 'libxcursor' 'libxkbcommon' 'pixman' 'libdrm' 'mesa' 'libinput' 'seatd' 'glibc' 'freeimage' 'fontconfig' 'freetype2' 'icu' 'systemd-libs')
makedepends=('meson')
source=(${pkgname}-${pkgver}.tar.gz::${url}/archive/refs/tags/v${pkgver}-1.tar.gz)
sha256sums=('71e77d81afb563e9ea3abbbda836ef05a966bb5751cefafa6ab8728e21cd7d3b')


build() {
    arch-meson "Louvre-$pkgver-1/src" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}

