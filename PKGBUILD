# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=hp-snmp-agents
pkgver=9.50_2564
pkgrel=1
pkgdesc="Insight Management SNMP Agents for HP ProLiant Systems"
arch=(i686 x86_64)
url="http://downloads.linux.hp.com/SDR/downloads/mcp"
depends=(bash hp-health ethtool pciutils net-snmp)
groups=(hpproliant)
license=("CUSTOM")

sha256sums=('a72a0d4335a356efb3322cbe37b1a5b94eeb4e9304aff9a266892289059a199a')
rpmrel=40
if [ "$CARCH" = "i686" ]; then
	rpmrel=36
	sha256sums[0]='cd420d5b2862fafa9413aa8ac598eeaf28500619c549499b2f069e4d6ee12c51'
fi

[ "$CARCH" = "x86_64" ] && depends=(${depends[@]} lib32-gcc-libs)

source=(http://downloads.linux.hp.com/SDR/downloads/mcp/centos/6/$CARCH/current/${pkgname}-${pkgver//_/-}.$rpmrel.rhel6.$CARCH.rpm)

package() {
	cp -a "$srcdir/"{etc,opt,sbin,usr,var} "$pkgdir"
}

