# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-snmp-agents
pkgver=10.50_2926.49
pkgrel=1
pkgdesc="Insight Management SNMP Agents for HP ProLiant Systems"
arch=(i686 x86_64)
url="http://downloads.linux.hpe.com/SDR/downloads/mcp"
depends=(bash hp-health ethtool pciutils net-snmp)
groups=(hpproliant)
license=("CUSTOM")

_i686ver=10.50_2926.42

source_i686=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/6/i686/current/$pkgname-${_i686ver//_/-}.rhel6.i686.rpm")
source_x86_64=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.rhel7.x86_64.rpm")

sha256sums_i686=('8f9567ddebc88956e53ddcd1298c3b7ca37492fefefc36b53015340781adbf60')
sha256sums_x86_64=('d5908d5629f439ff1cf6f5cbfa3900b4c7bf48613226e5dd2ccfcefa2a90f43c')

package() {
	mv sbin usr/bin
	[ -d usr/lib64 ] && mv usr/lib64 usr/lib
	cp -a etc opt usr var "$pkgdir"

	rm -rf "$pkgdir"/etc/init.d
}
