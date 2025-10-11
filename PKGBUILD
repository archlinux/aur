pkgname=flutter-gtk-3.29.3
pkgver=3.29.3
pkgrel=1
pkgdesc="Flutter GTK embedder runtime."
url="https://flutter.dev/"
arch=("x86_64" "aarch64")
license=("Apache-2.0")
provides=("libflutter_linux_gtk.so.${pkgver}")
depends=("glibc" "glib2" "fontconfig" "pango" "at-spi2-core" "gtk3" "libepoxy" "cairo")

_enginever="cf56914b326edb0ccb123ffdc60f00060bd513fa"
_storagebase="${FLUTTER_STORAGE_BASE_URL:-"https://storage.googleapis.com"}"

source_x86_64=(
  # engine/linux-$ARCH-release
  "gtk-release-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-x64-release/linux-x64-flutter-gtk.zip"
)
source_aarch64=(
  # engine/linux-$ARCH-release
  "gtk-release-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-arm64-release/linux-arm64-flutter-gtk.zip"
)
sha256sums_x86_64=('82d1961fe12118ba64e4d906a2b85c21048d5f84d583b17bfbb6e5639b3836b3')
sha256sums_aarch64=('ff53acb192915ed3b957accba20e63bfe1f89da97789e77c92574c506948483f')

build() {
  true
}

package() {
  install -Dm755 "libflutter_linux_gtk.so" "${pkgdir}/usr/lib/flutter_gtk/${pkgver}/libflutter_linux_gtk.so"
  ln -sfr "${pkgdir}/usr/lib/flutter_gtk/${pkgver}/libflutter_linux_gtk.so" "${pkgdir}/usr/lib/libflutter_linux_gtk.so.${pkgver}"
}