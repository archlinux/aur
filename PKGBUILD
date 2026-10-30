# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: esrh - https://esrh.me

pkgname=dissent-bin
_pkgname="${pkgname%-bin}"
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.39
pkgrel=1
pkgdesc='Discord client written in go and gtk4 (binary version)'
arch=(x86_64 aarch64)
url='https://github.com/diamondburned/dissent'
license=('GPL-3.0-only')
depends=(
  'gtk4>=4.10.3'
  'libadwaita>=1.3.2'
  cairo
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gobject-introspection
  graphene
  gtksourceview5
  harfbuzz
  hicolor-icon-theme
  libgirepository
  libspelling
  pango
  vulkan-icd-loader
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("dissent-linux-amd64-${pkgver}.tar.zst::https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-amd64.tar.zst")
source_aarch64=("dissent-linux-arm64-${pkgver}.tar.zst::https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-arm64.tar.zst")
sha256sums_x86_64=('be0660ea20490310924346e51a098f94b3e5333b33a1c5e04e549a5e00aebd11')
sha256sums_aarch64=('9540c91407d979204aea5a47ef3db5f712e3df560ace65316188bcdc6c398902')

package() {
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cp -dr "share" "${pkgdir}/usr/"
}
