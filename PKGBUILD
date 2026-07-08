pkgname=liber-bin
pkgver=1.0.1
pkgrel=1
pkgdesc="A browser-native email client"
arch=('x86_64')
url="https://liber.sh"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('webkit2gtk-4.1' 'gtk3' 'dbus')
provides=('liber')
conflicts=('liber')
source=("https://github.com/nickheyer/liber-desktop/releases/download/v${pkgver}/liber_${pkgver}_amd64.deb")
sha256sums=('639c18969ab2f4a6b0c8b8ed9a9e3069ae65730cb3be569fd1573a24bb95ddb1')

package() {
  # tauri deb layout: usr/bin/liber + .desktop + hicolor icons
  bsdtar -O -xf "liber_${pkgver}_amd64.deb" 'data.tar.*' | bsdtar -xf - -C "${pkgdir}"
  chmod -R u=rwX,go=rX "${pkgdir}/usr"
}
