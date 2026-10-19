# Maintainer: Aditya Miskin <adityamiskin98@gmail.com>

pkgname=typeaside-bin
pkgver=0.2.32
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
sha256sums=('3c25586b3576912a12f2cf6f2f7f452bf7729f0e25fb46ae896526480701f5b7')

package() {
  bsdtar -xOf "typeaside-${pkgver}.deb" 'data.tar*' | bsdtar -xf - -C "$pkgdir"
}
