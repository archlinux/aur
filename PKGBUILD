# Maintainer: Mattanja D. Heck

pkgname=ziti-edge-tunnel
pkgver=0.20.9
pkgrel=1
pkgdesc="The linux tunneller for your ZITI network."
arch=( 'x86_64' )
depends=()
options=()
url="https://openziti.github.io/ziti/clients/linux.html"
license=('Apache-2.0')
install="ziti-edge-tunnel.install"

source=("https://netfoundry.jfrog.io/artifactory/zitipax-openziti-deb-stable/pool/ziti-edge-tunnel/focal/ziti-edge-tunnel-${pkgver}-${pkgrel}.deb")
sha256sums=('725a6e7db87ce4dbb1338a947d6878073a6d99abb5b90fdac3caaf5be76845be')

package() {
	tar xf data.tar.gz -C "${pkgdir}"

	mkdir -p ${pkgdir}/opt/openziti/etc/identities/
	
	install -D -m755 ${pkgdir}/opt/openziti/bin/ziti-edge-tunnel ${pkgdir}/usr/bin/ziti-edge-tunnel
	install -D -m644 ${pkgdir}/opt/openziti/share/ziti-edge-tunnel.service ${pkgdir}/etc/systemd/system/ziti-edge-tunnel.service
}
