pkgname=liber-bin
pkgver=1.0.15
pkgrel=1
pkgdesc="A browser-native email client"
arch=('x86_64')
url="https://liber.sh"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('webkit2gtk-4.1' 'gtk3' 'dbus')
provides=('liber')
conflicts=('liber')
source=("https://github.com/nickheyer/liber-releases/releases/download/v${pkgver}/liber_${pkgver}_amd64.deb")
sha256sums=('2533120865db80f30ef0343711a966804ec29c604b992071768a89bd9408ccab')

package() {
  bsdtar -O -xf "liber_${pkgver}_amd64.deb" 'data.tar.*' | bsdtar -xf - -C "${pkgdir}"
  chmod -R u=rwX,go=rX "${pkgdir}/usr"
}
