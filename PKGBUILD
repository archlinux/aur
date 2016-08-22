# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-snmp-agents
pkgver=10.40_2847.17
pkgrel=1
pkgdesc="Insight Management SNMP Agents for HP ProLiant Systems"
arch=(i686 x86_64)
url="http://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash hp-health ethtool pciutils net-snmp)
groups=(hpproliant)
license=("CUSTOM")

_i686ver=10.30_2819.17

source_i686=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/6/i686/current/$pkgname-${_i686ver//_/-}.rhel6.i686.rpm")
source_x86_64=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.rhel7.x86_64.rpm")

sha256sums_i686=('4ebe3e253c1a35a004d43c265990be0f15b8d1cb565409c1e97105cafae9396c')
sha256sums_x86_64=('ed0c8da5be26549dba1aa6dff5dbbf3002857678b6a30379efa5e8f4613b887f')

package() {
	mv sbin usr/bin
	[ -d usr/lib64 ] && mv usr/lib64 usr/lib
	cp -a etc opt usr var "$pkgdir"

	rm -rf "$pkgdir"/etc/init.d
}
