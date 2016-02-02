# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-snmp-agents
pkgver=10.20_2789.26
pkgrel=1
pkgdesc="Insight Management SNMP Agents for HP ProLiant Systems"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(bash hp-health ethtool pciutils net-snmp)
groups=(hpproliant)
license=("CUSTOM")

source_i686=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/6/i686/current/$pkgname-${pkgver//_/-}.rhel6.i686.rpm")
source_x86_64=("http://downloads.linux.hpe.com/SDR/repo/mcp/centos/7/x86_64/current/$pkgname-${pkgver//_/-}.rhel7.x86_64.rpm")

sha256sums_i686=('589d1a0aff45d49044e018ce6b173e1c51ff71c71320909c30f276420bfa0d5f')
sha256sums_x86_64=('dccafd305dcccf9ac8c07bb9cd68c1dda815a92a48edc46e1197316bbfb88df7')

package() {
	mv sbin usr/bin
	[ -d usr/lib64 ] && mv usr/lib64 usr/lib
	cp -a etc opt usr var "$pkgdir"

	rm -rf "$pkgdir"/etc/init.d
}
