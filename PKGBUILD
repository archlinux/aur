# Maintainer: Dallo <dallo@tutanota.com>

pkgname=surfshark-yac
pkgver=2.4.3.4018
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
source=("https://ocean.surfshark.com/debian/pool/main/s/surfshark_2.4.3_amd64.deb")
sha256sums=('3b207046aa7e0e31c55c63596f1457251d9fdf5dc1e306bba707702993ea9fd6aa621')

package() {
	# Extract package data
	tar -xJ -f data.tar.xz -C "${pkgdir}"

	install -D -m644 "${pkgdir}/opt/Surfshark/resources/dist/resources/surfsharkd.js.LICENSE.txt" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
