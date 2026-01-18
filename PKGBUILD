# Maintainer: hex4 (hex4@duck.com)
pkgname=tanuki-bin
pkgver=0.1.3
pkgrel=1
pkgdesc="Hourly Animal Crossing vibes, now on your desktop"
arch=('x86_64')
url="https://github.com/Hex-4/tanuki"
license=('MIT')
depends=('cairo' 'desktop-file-utils' 'gdk-pixbuf2' 'glib2' 'gtk3' 'hicolor-icon-theme' 'libsoup' 'pango' 'webkit2gtk-4.1')
options=('!strip' '!debug')
install=${pkgname}.install
source_x86_64=("${url}/releases/download/app-v${pkgver}/tanuki_${pkgver}_amd64.deb")
sha256sums_x86_64=('43ae395b2770287c1e1b58d5f27482ef3ee4c1149bdd312af777805c3f85f8ea')
package() {
  bsdtar -xf "tanuki_${pkgver}_amd64.deb"
  bsdtar -xf data.tar.gz -C "${pkgdir}"

  if [ -f "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" ]; then
    install -Dm644 "${pkgdir}/usr/share/doc/${pkgname}/LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
  fi
}
