# Maintainer: Lex Black <autumn-wind@web.de>

_pkgname=srm
pkgname=lib${_pkgname}
pkgver=0.4.0_1
pkgrel=1
pkgdesc="C library that simplifies the development of Linux DRM/KMS applications"
arch=('x86_64')
url="https://github.com/CuarzoSoftware/SRM"
license=('GPL3')
depends=('libglvnd' 'libdrm' 'mesa' 'libdisplay-info' 'libinput' 'seatd' 'glibc' 'systemd-libs')
makedepends=('meson')
source=(${_pkgname}-${pkgver/_/-}.tar.gz::$url/archive/refs/tags/v${pkgver/_/-}.tar.gz)
sha256sums=('d453770049947be9135cbfcf5a6d2d32e3dfb1b56a31004505e8ff35d5858999')


build() {
    arch-meson "SRM-${pkgver/_/-}/src" build
    meson compile -C build
}

package() {
    meson install -C build --destdir "$pkgdir"
}

