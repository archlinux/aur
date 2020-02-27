# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=ssacli
pkgver=4.15_6.0
pkgrel=1
pkgdesc="HP Command Line Smart Storage Administrator"
arch=(x86_64)
url="https://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash)
replaces=(hpacucli hpssacli)
groups=(hpproliant)
license=("CUSTOM")

source=("https://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")
sha256sums=('80632df2bf157cd95dc935e3d5d582aec397399d3336a541defd302d5a8b2b3b')

package() {
	mv usr/{sbin,bin}
	mv usr/{,share/}man
	install -Dm644 opt/smartstorageadmin/ssacli/bin/ssacli.license "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
	rm opt/smartstorageadmin/ssacli/bin/ssacli.license
	cp -a opt usr "$pkgdir"
}
