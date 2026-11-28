# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=hibiki-bin
pkgver=0.2.0
pkgrel=1
pkgdesc="GTK4 layer-shell keystroke visualizer for Wayland"
arch=('x86_64' 'aarch64')
url="https://github.com/linuxmobile/hibiki"
license=('MIT')
depends=('alsa-lib' 'dbus' 'fontconfig' 'gdk-pixbuf2' 'glib2' 'glibc' 'gtk4' 'gtk4-layer-shell' 'libgcc' 'libxkbcommon' 'pango')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/linuxmobile/hibiki/v${pkgver}/LICENSE")
source_x86_64=("${pkgname}-${pkgver}-x86_64::${_dl}/hibiki-linux-x86_64")
source_aarch64=("${pkgname}-${pkgver}-aarch64::${_dl}/hibiki-linux-aarch64")
sha256sums=('dda0176aea59bbfa2ac71073dd7d9abf888e4e40afc71f07ff10444416667233')
sha256sums_x86_64=('584cf14d6d5f715da95046f20c810d1e91bf383fcf53393344fe7af22b09a079')
sha256sums_aarch64=('d09b4f93c1551dbd739667226140c89e61a407a075571fa5a7da317fd36a2239')

package() {
  install -Dm755 "${pkgname}-${pkgver}-${CARCH}" "${pkgdir}/usr/bin/hibiki"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
