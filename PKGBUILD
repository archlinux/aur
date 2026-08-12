# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname=mangowm
_pkgname=mango
pkgver=0.16.0
pkgrel=1
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/DreamMaoMao/mangowc"
arch=("x86_64")
license=("GPL-3.0-or-later")
depends=('glibc' 'wayland-protocols' 'pango' 'wayland' 'libinput' 'libdrm' 'pixman' 'libdisplay-info' 'libliftoff' 'seatd' 'xorg-xwayland' 'libxcb' 'libxkbcommon' 'pcre2' 'libwlroots-0.20.so' 'scenefx0.5' 'cjson')
provides=('wayland-compositor' 'mangowc')
replaces=( 'mangowc')
makedepends=('meson' 'ninja' 'wayland-protocols')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/mangowm/mango/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('dc6ccb9d7c2d301390c6159cd64b49a4ebdc6709a2b2dbe3d31e78041374492a')

build() {
  cd "$_pkgname-$pkgver"
  meson build --prefix /usr
}

package() {
  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}

