# Maintainer: bobo <https://aur.archlinux.org/account/bobosingle>

pkgname=manis-bin
pkgver=0.1.23
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
sha256sums_x86_64=('7937190c6c6f41cf69c2c6d22f3adba43caa43406b975914858b480df21ff191')

package() {
  cp -a "${srcdir}/usr" "${pkgdir}/"
  rm "${pkgdir}/usr/share/licenses/manis/Mihomo-GPL-3.0.txt"
}
