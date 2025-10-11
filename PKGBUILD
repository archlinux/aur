pkgname=flutter-gtk-3.16.9
pkgver=3.16.9
pkgrel=1
pkgdesc="Flutter GTK embedder runtime."
url="https://flutter.dev/"
arch=("x86_64" "aarch64")
license=("Apache-2.0")
provides=("libflutter_linux_gtk.so.${pkgver}")
depends=("glibc" "glib2" "fontconfig" "pango" "at-spi2-core" "gtk3" "libepoxy" "cairo")

_enginever="f40e976bedff57e69e1b3d89a7c2a3c617a03dad"
_storagebase="${FLUTTER_STORAGE_BASE_URL:-"https://storage.googleapis.com"}"

source_x86_64=(
  # engine/linux-$ARCH-release
  "gtk-release-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-x64-release/linux-x64-flutter-gtk.zip"
)
source_aarch64=(
  # engine/linux-$ARCH-release
  "gtk-release-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-arm64-release/linux-arm64-flutter-gtk.zip"
)
sha256sums_x86_64=('131b4b8dd1ca69ddd155784d68bd9af8e32efcb25c359fbd98e755e1daa28389')
sha256sums_aarch64=('6ca5bff4f27d68a1598e1fea53feed679ce38e47d8c0616f3103cfab1081413d')

build() {
  true
}

package() {
  install -Dm755 "libflutter_linux_gtk.so" "${pkgdir}/usr/lib/flutter_gtk/${pkgver}/libflutter_linux_gtk.so"
  ln -sfr "${pkgdir}/usr/lib/flutter_gtk/${pkgver}/libflutter_linux_gtk.so" "${pkgdir}/usr/lib/libflutter_linux_gtk.so.${pkgver}"
}