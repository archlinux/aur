# Maintainer: Dallo <dallo@tutanota.com>

pkgname=surfshark-yac
pkgver=2.3.1.3267
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
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark_2.3.1_amd64.deb")
sha256sums=('e72af93cb2e998331f0a898b95e29de1280e1db52c1f40cbd5f2167975f0eb3c')

package() {
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
