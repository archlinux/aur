# Maintainer: Dallo <dallo@tutanota.com>

pkgname=surfshark-yac
pkgver=2.2.0.2835
pkgrel=1
pkgdesc="Yet another Surfshark VPN GUI Client for the AUR."
arch=('x86_64')
url="https://surfshark.com"
license=('custom:surfshark')
depends=('alsa-lib' 'at-spi2-core' 'gjs' 'nss' 'org.freedesktop.secrets' 'wireguard-tools')
options=('!strip' '!emptydirs')
provides=("surfshark-yac")
conflicts=("surfshark-yac")
install=surfshark-yac.install
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark_2.2.0_amd64.deb")
sha256sums=('c9dc96dbcf7a970e4fe2b4de71e3fb6655f75446ef1dbfc02856ff5de40efb64')

package() {
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
