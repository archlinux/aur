# Maintainer: Dallo <dallo@tutanota.com>

pkgname=surfshark-yac
pkgver=2.4.1.3954
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
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark_2.4.1_amd64.deb")
sha256sums=('eb494c91f5132736be47d208d3399452111faa1185580f50e47a1960b08aa621')

package() {
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
