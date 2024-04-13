# Maintainer: Mattanja D. Heck
# Maintainer: Ben Cooper

pkgname=ziti-edge-tunnel
pkgver=0.22.26
pkgrel=1
pkgdesc="The linux tunneller for your ZITI network."
arch=( 'x86_64' )
depends=()
options=()
url="https://openziti.github.io/ziti/clients/linux.html"
license=('Apache-2.0')
install="ziti-edge-tunnel.install"

source=("https://netfoundry.jfrog.io/artifactory/zitipax-openziti-deb-stable/pool/ziti-edge-tunnel/jammy/amd64/ziti-edge-tunnel-${pkgver}-${pkgrel}.deb")
sha256sums=('ee04b66cf86dd5088f4a456e9f9c88271bf5e71c8200b11fb16cf0e3bd0378d5')

package() {
	tar xf data.tar.gz -C "${pkgdir}"

	mkdir -p ${pkgdir}/opt/openziti/etc/identities/
	
	install -D -m755 ${pkgdir}/opt/openziti/bin/ziti-edge-tunnel ${pkgdir}/usr/bin/ziti-edge-tunnel
	install -D -m644 ${pkgdir}/opt/openziti/share/ziti-edge-tunnel.service ${pkgdir}/etc/systemd/system/ziti-edge-tunnel.service
}
