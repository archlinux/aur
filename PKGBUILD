# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=ssacli
pkgver=2.60_18.0
pkgrel=1
pkgdesc="HP Command Line Smart Storage Administrator"
arch=(i686 x86_64)
url="http://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash)
replaces=(hpacucli hpssacli)
groups=(hpproliant)
license=("CUSTOM")

# hp doen't release the same versions for both archs sometimes
_i686ver=$pkgver

source_i686=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/6/i686/current/$pkgname-${_i686ver//_/-}.i386.rpm")
source_x86_64=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.x86_64.rpm")

sha256sums_i686=('d44f9f01ea485e2b08db60a2807ae062f5c7b0f15e0118faa0b85700aad1c9f8')
sha256sums_x86_64=('3b87ebebd551b846f185918f8b79aefd6df01a473c8858d2701e67f7a4e64ae0')

package() {
	mv usr/{sbin,bin}
	cp -a opt usr "$pkgdir"
}
