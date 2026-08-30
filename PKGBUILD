# Maintainer: bobo <https://aur.archlinux.org/account/bobosingle>

pkgname=manis-bin
pkgver=0.1.24
pkgrel=1
pkgdesc="GPUI desktop workbench for policy-based proxy routing"
arch=('x86_64')
url="https://github.com/kaigedong/Manis"
license=('Apache-2.0' 'GPL-3.0-only')
depends=(
  'alsa-lib'
  'cairo'
  'fontconfig'
  'freetype2'
  'gcc-libs'
  'gdk-pixbuf2'
  'glib2'
  'glibc'
  'gtk3'
  'hicolor-icon-theme'
  'libappindicator'
  'libcap'
  'libx11'
  'libxcb'
  'libxkbcommon'
  'libxkbcommon-x11'
  'pango'
  'polkit'
  'vulkan-icd-loader'
  'wayland'
  'xdotool'
)
provides=("manis=${pkgver}")
conflicts=('manis')
options=('!debug' '!strip')
_upstream_pkgrel=1
source_x86_64=(
  "manis-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst::https://github.com/kaigedong/Manis/releases/download/build-${pkgver}/manis-${pkgver}-${_upstream_pkgrel}-${CARCH}.pkg.tar.zst"
)
sha256sums_x86_64=('c94433b37620b12f8b06b5c3f02cd87f83c70209eea44afc40c67f531ec5695e')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
  rm "${pkgdir}/usr/share/licenses/manis/Mihomo-GPL-3.0.txt"
}
