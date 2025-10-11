pkgname=flutter-gtk-3.32.4
pkgver=3.32.4
pkgrel=1
pkgdesc="Flutter GTK embedder runtime."
url="https://flutter.dev/"
arch=("x86_64" "aarch64")
license=("Apache-2.0")
provides=("libflutter_linux_gtk.so.${pkgver}")
depends=("glibc" "glib2" "fontconfig" "pango" "at-spi2-core" "gtk3" "libepoxy" "cairo")

_enginever="8cd19e509d6bece8ccd74aef027c4ca947363095"
_storagebase="${FLUTTER_STORAGE_BASE_URL:-"https://storage.googleapis.com"}"

source_x86_64=(
  # engine/linux-$ARCH-release
  "gtk-release-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-x64-release/linux-x64-flutter-gtk.zip"
)
source_aarch64=(
  # engine/linux-$ARCH-release
  "gtk-release-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-arm64-release/linux-arm64-flutter-gtk.zip"
)
sha256sums_x86_64=('ac00672fe1759169a2c9ece14339653c7c951aae0146413027f5fedc12a78082')
sha256sums_aarch64=('449ce7b3f51a8b433daafbece5733535dbe6e8ca261d3024f9231fa42ab428ab')

build() {
  true
}

package() {
  install -Dm755 "libflutter_linux_gtk.so" "${pkgdir}/usr/lib/flutter_gtk/${pkgver}/libflutter_linux_gtk.so"
  ln -sfr "${pkgdir}/usr/lib/flutter_gtk/${pkgver}/libflutter_linux_gtk.so" "${pkgdir}/usr/lib/libflutter_linux_gtk.so.${pkgver}"
}