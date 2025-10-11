pkgname=flutter-gtk-3.3.8
pkgver=3.3.8
pkgrel=1
pkgdesc="Flutter GTK embedder runtime."
url="https://flutter.dev/"
arch=("x86_64" "aarch64")
license=("Apache-2.0")
provides=("libflutter_linux_gtk.so.${pkgver}")
depends=("glibc" "glib2" "fontconfig" "pango" "at-spi2-core" "gtk3" "libepoxy" "cairo")

_enginever="857bd6b74c5eb56151bfafe91e7fa6a82b6fee25"
_storagebase="${FLUTTER_STORAGE_BASE_URL:-"https://storage.googleapis.com"}"

source_x86_64=(
  # engine/linux-$ARCH-release
  "gtk-release-x64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-x64-release/linux-x64-flutter-gtk.zip"
)
source_aarch64=(
  # engine/linux-$ARCH-release
  "gtk-release-arm64-${_enginever}.zip::${_storagebase}/flutter_infra_release/flutter/${_enginever}/linux-arm64-release/linux-arm64-flutter-gtk.zip"
)
sha256sums_x86_64=('20679978596e5183a762a68ef95d06958781b5ed98aeb4aca76c3b3482f21807')
sha256sums_aarch64=('abd5127bc5d379c567e86cbbb6b9d37a13d1b600c50d86756ab440ef92d96d9b')

build() {
  true
}

package() {
  install -Dm755 "libflutter_linux_gtk.so" "${pkgdir}/usr/lib/flutter_gtk/${pkgver}/libflutter_linux_gtk.so"
  ln -sfr "${pkgdir}/usr/lib/flutter_gtk/${pkgver}/libflutter_linux_gtk.so" "${pkgdir}/usr/lib/libflutter_linux_gtk.so.${pkgver}"
}