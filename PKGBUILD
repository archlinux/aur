# Maintainer: txtsd <aur.archlinux@ihavea.quest>
# Maintainer: esrh - https://esrh.me

pkgname=dissent-bin
_pkgname="${pkgname%-bin}"
_fqpn=so.libdb.${_pkgname}
pkgver=0.0.50
pkgrel=2
pkgdesc='Discord client written in go and gtk4 (binary version)'
arch=(x86_64 aarch64)
url='https://github.com/diamondburned/dissent'
license=('GPL-3.0-only')
depends=(
  cairo
  gcc-libs
  gdk-pixbuf2
  glib2
  glibc
  gobject-introspection
  graphene
  gtk4
  gtksourceview5
  harfbuzz
  hicolor-icon-theme
  libadwaita
  libgirepository
  libspelling
  pango
  vulkan-icd-loader
  webkitgtk-6.0
)
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source_x86_64=("dissent-linux-amd64-${pkgver}.tar.zst::https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-amd64.tar.zst")
source_aarch64=("dissent-linux-arm64-${pkgver}.tar.zst::https://github.com/diamondburned/dissent/releases/download/v${pkgver}/dissent-linux-arm64.tar.zst")
sha256sums_x86_64=('a9dc0ca5a83c43c21ef4420e55bddc9129c0ad210503805499b61e1f51a5baec')
sha256sums_aarch64=('2cafbdf3008f0d98244f73251485f4844e614048cd087c72286ac90658eda239')

package() {
  install -Dm755 "bin/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"

  cp -dr "share" "${pkgdir}/usr/"
}
