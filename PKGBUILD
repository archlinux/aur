pkgname=flutter-gtk-3.19.5
pkgver=3.19.5
pkgrel=1
pkgdesc="Flutter GTK embedder runtime."
url="https://flutter.dev/"
arch=("x86_64" "aarch64")
license=("Apache-2.0")
provides=("libflutter_linux_gtk.so.${pkgver}")
depends=("glibc" "glib2" "fontconfig" "pango" "at-spi2-core" "gtk3" "libepoxy" "cairo")

_enginever="e76c956498841e1ab458577d3892003e553e4f3c"
_storagebase="${FLUTTER_STORAGE_BASE_URL:-"https://storage.googleapis.com"}"

source_x86_64=(
  # engine/linux-$ARCH-release
  "gtk-release-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-x64-release/linux-x64-flutter-gtk.zip"
)
source_aarch64=(
  # engine/linux-$ARCH-release
  "gtk-release-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-arm64-release/linux-arm64-flutter-gtk.zip"
)
sha256sums_x86_64=('06709a7cdbe22c47a3a24fa51411a1c85a563aa04cb93e34cb6aa6089062e91f')
sha256sums_aarch64=('a7fc7ca0875d1b74697ebdbb857eb7520f16f46a9c23bd0debc5802be8e571ac')

build() {
  true
}

package() {
  install -Dm755 "libflutter_linux_gtk.so" "${pkgdir}/usr/lib/flutter_gtk/${pkgver}/libflutter_linux_gtk.so"
  ln -sfr "${pkgdir}/usr/lib/flutter_gtk/${pkgver}/libflutter_linux_gtk.so" "${pkgdir}/usr/lib/libflutter_linux_gtk.so.${pkgver}"
}