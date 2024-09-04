# Maintainer: David J. Allen <allend@lanl.gov>
pkgname=magellan-bin
pkgver=v0.1.5
pkgrel=1
pkgdesc="Redfish-based BMC discovery tool written in Go"
arch=("x86_64")
url="https://github.com/OpenCHAMI/magellan"
license=('MIT')
groups=("openchami")
provides=('magellan')
conflicts=('magellan')
source_x86_64=("${url}/releases/download/${pkgver}/magellan_Linux_x86_64.tar.gz")
sha256sums_x86_64=('1bb028d592d5389b519362e6aa7021f27443f0b36471e09ee7f47ab5cb6d4d7f')

package() {
	cd "$srcdir/" || exit

	# install the binary to /usr/bin
	mkdir -p "${pkgdir}/usr/bin"
	install -m755 magellan "${pkgdir}/usr/bin/magellan"
}

clean() {
	cd "$srcdir/" || exit
	rm *.tar.gz *.tar.zst
}
