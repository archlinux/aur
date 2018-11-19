# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=ssacli
pkgver=3.30_14.0
pkgrel=1
pkgdesc="HP Command Line Smart Storage Administrator"
arch=(x86_64)
url="https://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash)
replaces=(hpacucli hpssacli)
groups=(hpproliant)
license=("CUSTOM")

source=("https://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")
sha256sums=('499f454e195eaa0b211f7118c3224a0a26fc5626677e26054e860137c2342c0f')

package() {
	mv usr/{sbin,bin}
	mv usr/{,share/}man
	install -Dm644 opt/smartstorageadmin/ssacli/bin/ssacli.license "$pkgdir"/usr/share/licenses/$pkgname/LICENSE.txt
	rm opt/smartstorageadmin/ssacli/bin/ssacli.license
	cp -a opt usr "$pkgdir"
}
