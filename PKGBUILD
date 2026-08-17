# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname=mangowm
_pkgname=mango
pkgver=0.16.1
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
sha256sums=('fe3d34e5731983083a83cc2b4ce0f61b538d2fe7f84e7a85aae5ec427d863c10')

build() {
  cd "$_pkgname-$pkgver"
  meson build --prefix /usr
}

package() {
  cd "$_pkgname-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}

