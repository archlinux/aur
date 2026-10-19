# Maintainer: Aditya Miskin <adityamiskin98@gmail.com>

pkgname=typeaside-bin
pkgver=0.2.30
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
sha256sums=('acacaf17b688288ab64312c1f24a6ec78095dcb3e3cedc5278b479a90b45d4f8')

package() {
  bsdtar -xOf "typeaside-${pkgver}.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
}
