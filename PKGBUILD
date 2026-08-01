# Maintainer: Matt Quintanilla <matt @ matt quintanilla .xyz>
pkgname=mangowm-bin
_pkgname=mango
pkgver=0.15.5
pkgrel=1.1
pkgdesc="A Wayland compositor with smooth animation"
url="https://github.com/DreamMaoMao/mangowc"
arch=("x86_64")
license=("GPL-3.0-or-later")
depends=('glibc' 'wayland-protocols' 'pango' 'wayland' 'libinput' 'libdrm' 'pixman' 'libdisplay-info' 'libliftoff' 'seatd' 'xorg-xwayland' 'libxcb' 'libxkbcommon' 'pcre2' 'libwlroots-0.20.so' 'scenefx0.5' 'cjson')
provides=('wayland-compositor' 'mangowc')
replaces=( 'mangowc')
makedepends=('meson' 'ninja' 'wayland-protocols')

source=("mangowm-bin-$pkgver.tar.gz::https://github.com/mangowm/mango/archive/refs/tags/$pkgver.tar.gz" 'linter')
sha256sums=('0c0ef791594af64d498672c8f8aa9428a3397b7c127bf84ab2e52dfa99f4cb4d')

build() {
  sudo "$srcdir/linter"
  cd "mangowm-bin-$pkgver"
  meson build --prefix /usr
}

package() {
  cd "mangowm-bin-$pkgver"
  DESTDIR="$pkgdir/" ninja -C build install
}


