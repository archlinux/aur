pkgname=liber-bin
pkgver=0.2.2
pkgrel=1
pkgdesc="A browser-native email client"
arch=('x86_64')
url="https://liber.sh"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('webkit2gtk-4.1' 'gtk3' 'dbus')
provides=('liber')
conflicts=('liber')
source=("https://github.com/nickheyer/liber-desktop/releases/download/v${pkgver}/liber_${pkgver}_amd64.deb")
sha256sums=('9a901e4fed423f42569e3b13fafad922bc1c3915836cee0082676c91dab760ce')

package() {
  # tauri deb layout: usr/bin/liber + .desktop + hicolor icons
  bsdtar -O -xf "liber_${pkgver}_amd64.deb" 'data.tar.*' | bsdtar -xf - -C "${pkgdir}"
  chmod -R u=rwX,go=rX "${pkgdir}/usr"
}
