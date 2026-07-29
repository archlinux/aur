pkgname=liber-bin
pkgver=1.0.19
pkgrel=1
pkgdesc="A browser-native email client"
arch=('x86_64')
url="https://liber.sh"
license=('LicenseRef-PolyForm-Noncommercial-1.0.0')
depends=('webkit2gtk-4.1' 'gtk3' 'dbus')
provides=('liber')
conflicts=('liber')
source=("https://github.com/nickheyer/liber-releases/releases/download/v${pkgver}/liber_${pkgver}_amd64.deb")
sha256sums=('fa3027d937bbc1d18f8797820849d2f6670d2e37a7bff2339ec5f9d213dc2c64')

package() {
  bsdtar -O -xf "liber_${pkgver}_amd64.deb" 'data.tar.*' | bsdtar -xf - -C "${pkgdir}"
  chmod -R u=rwX,go=rX "${pkgdir}/usr"
}
