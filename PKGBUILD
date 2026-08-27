# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname=mangowm
_pkgname=mango
pkgver=0.16.2
pkgrel=2
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/DreamMaoMao/mangowc"
arch=("x86_64" "aarch64")
license=("GPL-3.0-or-later")
depends=('glibc' 'wayland-protocols' 'pango' 'wayland' 'libinput' 'libdrm' 'pixman' 'libdisplay-info' 'libliftoff' 'seatd' 'xorg-xwayland' 'libxcb' 'libxkbcommon' 'pcre2' 'libwlroots-0.20.so' 'scenefx0.5' 'cjson')
provides=('wayland-compositor' 'mangowc')
replaces=( 'mangowc')
makedepends=('meson' 'ninja' 'wayland-protocols')

source=("$_pkgname-$pkgver.tar.gz::https://github.com/mangowm/mango/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('f508f4521efb7c8de0af37143748a7bbd34a562e4f646515521e97c5410a6ed9')

build() {
  cd "$_pkgname-$pkgver"
  meson build --prefix /usr
}

package() {
  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}

