# Maintainer: Simon Ser <contact@emersion.fr>

pkgname=libdisplay-info
pkgver=0.1.1
pkgrel=1
pkgdesc='EDID and DisplayID library'
url='https://gitlab.freedesktop.org/emersion/libdisplay-info'
arch=('x86_64')
license=('MIT')
source=(
  "$url/-/releases/$pkgver/downloads/libdisplay-info-$pkgver.tar.xz"
  "$url/-/releases/$pkgver/downloads/libdisplay-info-$pkgver.tar.xz.sig"
)
sha256sums=(
  "0d8731588e9f82a9cac96324a3d7c82e2ba5b1b5e006143fefe692c74069fb60"
  "70699e1fa9dcb41333d9a7189c4aa5bd4c789dfc3c571b5c9975bd542c1862af"
)
validpgpkeys=("34FF9526CFEF0E97A340E2E40FDE7BE0E88F5E48")
makedepends=(git meson ninja python hwdata)

build() {
  arch-meson libdisplay-info-$pkgver build
  ninja -C build
}

# TODO: wait until this is resolved:
# https://gitlab.freedesktop.org/emersion/libdisplay-info/-/issues/35
#check() {
#}

package() {
  DESTDIR="$pkgdir" ninja -C build install
}
