# Maintainer: Aditya Miskin <adityamiskin98@gmail.com>

pkgname=typeaside-bin
pkgver=0.7.0
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
sha256sums=('f2236b981fb7908a8f7c4b9f99c6032184694d45aab9b30f00eea17f443422e3')

package() {
  bsdtar -xOf "typeaside-${pkgver}.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
}
