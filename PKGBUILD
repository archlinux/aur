pkgname=liber-bin
pkgver=1.0.5
pkgrel=1
pkgdesc="A browser-native email client"
arch=('x86_64')
url="https://liber.sh"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('webkit2gtk-4.1' 'gtk3' 'dbus')
provides=('liber')
conflicts=('liber')
source=("https://github.com/nickheyer/liber-releases/releases/download/v${pkgver}/liber_${pkgver}_amd64.deb")
sha256sums=('ae6831719f4381023dd00d34a202c5534c499ce96585e4e2c1ccd3534c087c96')

package() {
  # tauri deb layout: usr/bin/liber + .desktop + hicolor icons
  bsdtar -O -xf "liber_${pkgver}_amd64.deb" 'data.tar.*' | bsdtar -xf - -C "${pkgdir}"
  chmod -R u=rwX,go=rX "${pkgdir}/usr"
}
