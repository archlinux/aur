# Maintainer: bobo <https://aur.archlinux.org/account/bobosingle>

pkgname=manis-bin
pkgver=0.1.47
pkgrel=1
pkgdesc="GPUI desktop workbench for policy-based proxy routing"
arch=('x86_64')
url="https://github.com/kaigedong/Manis"
license=('Apache-2.0' 'GPL-3.0-only')
depends=(
  'alsa-lib'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'glibc'
  'hicolor-icon-theme'
  'libcap'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'polkit'
  'vulkan-icd-loader'
  'wayland'
)
provides=("manis=${pkgver}")
conflicts=('manis')
options=('!debug' '!strip')
install=manis.install
_upstream_pkgrel=1
source_x86_64=(
  "manis-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst::https://github.com/kaigedong/Manis/releases/download/build-${pkgver}/manis-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst"
)
sha256sums_x86_64=('25e37d5d3192e3f3c664a123f00edb7577fb9c6444a6e78c6681eb4bc506e99a')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
  rm "${pkgdir}/usr/share/licenses/manis/Mihomo-GPL-3.0.txt"
}
