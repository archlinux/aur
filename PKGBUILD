# Maintainer: Nicholas Galderisi <ngalderisi@spar.com>

pkgname=amsd
pkgver=1.4.0_3066.82
pkgrel=1
pkgdesc="HPE Agentless Management Service Daemon"
arch=(x86_64)
url="https://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash lsof coreutils pciutils)
groups=(hpproliant)
license=("CUSTOM")

source=("https://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.centos7.x86_64.rpm")
sha256sums=('cf880af3019886039d55661e4b45080135b142a98de99eb50dcce2a359999aa5')

package() {
	mkdir usr/bin
	mv sbin/* usr/bin/
	mv lib64/* usr/lib/
	rm -r lib64 sbin
	install -Dm644 opt/amsd/amsd.license "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
	rm opt/amsd/amsd.license
	cp -a etc opt usr "$pkgdir"
	}
