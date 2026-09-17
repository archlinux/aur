# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname=mangowm
_pkgname=mango
pkgver=0.17.2
pkgrel=1
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/DreamMaoMao/mangowc"
arch=("x86_64" "aarch64")
license=("GPL-3.0-or-later")
depends=('glibc' 'wayland-protocols' 'pango' 'wayland' 'libinput' 'libdrm' 'pixman' 'libdisplay-info' 'libliftoff' 'seatd' 'xorg-xwayland' 'libxcb' 'libxkbcommon' 'pcre2' 'libwlroots-0.20.so' 'scenefx0.5' 'cjson')
provides=('wayland-compositor' 'mangowc')
replaces=( 'mangowc')
makedepends=('meson' 'ninja' 'wayland-protocols')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/mangowm/mango/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8390a4d61a8e4c4adbe1ebf10ee98334fe54952f2c2a3669a21539d555a1bad9')

build() {
  cd "$_pkgname-$pkgver"
  meson build --prefix /usr
}

package() {
  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}

