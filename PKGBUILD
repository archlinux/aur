# Maintainer: Aditya Miskin <adityamiskin98@gmail.com>

pkgname=typeaside-bin
pkgver=0.2.18
pkgrel=1
pkgdesc='Native voice dictation for Wayland'
arch=('x86_64')
url='https://typeaside.app'
license=('LicenseRef-TypeAside')
# GPUI loads Wayland, Vulkan, X11, udev and font libraries at runtime; wl-clipboard pastes text.
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'systemd-libs'
  'vulkan-icd-loader'
  'wayland'
  'wl-clipboard'
)
optdepends=('vulkan-driver: GPU rendering')
provides=('typeaside')
conflicts=('typeaside')
options=('!debug' '!strip')
source=("typeaside-${pkgver}.deb::https://typeaside.app/releases/v${pkgver}/typeaside.deb")
noextract=("typeaside-${pkgver}.deb")
sha256sums=('5a15b976903c27893170cd2249414014865efe57213f5426e4f67e56378a01fd')

package() {
  bsdtar -xOf "typeaside-${pkgver}.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
}
