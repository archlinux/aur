# Maintainer: Rodrigo Quelhas <rodrigo_quelhas@outlook.pt>
pkgname=barracudavpn
pkgver=5.1.4
pkgrel=3
pkgdesc="Barracuda VPN Client for Linux"
arch=("i386" "x86_64")
install="${pkgname}.install"

url="https://campus.barracuda.com/product/networkaccessclient"
license=("custom:FortiClientSSLVPN")

depends=(
  "xterm"
)

source=("https://raw.githubusercontent.com/RomarQ/barracudavpn-archlinux/master/tarball/${pkgname}-${pkgver}.tar.gz")
sha256sums=('66128019ca60c0b028b3e99293aea3c6cca1dd57d5d2d8fe51cf31994764fab7')

bin_location="usr/bin"
options=(debug !strip)

package() {
	msg "Creating folders..."
	mkdir -p ${pkgdir}/opt/${pkgname}/icons
  mkdir -p ${pkgdir}/usr/share/applications
	mkdir -p ${pkgdir}/${bin_location}

	msg "Installing files..."
  install -Dm 4755 ${srcdir}/${pkgname}/${pkgname} ${pkgdir}/${bin_location}/${pkgname}
	install -Dm 4755 ${srcdir}/${pkgname}/${pkgname}.png ${pkgdir}/opt/${pkgname}/icons/
	install -Dm 4755 ${srcdir}/${pkgname}/${pkgname}.desktop ${pkgdir}/usr/share/applications/${pkgname}.desktop
}
