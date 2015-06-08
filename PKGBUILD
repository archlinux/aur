# Maintainer: Adrien Sohier <adrien.sohier@art-software.fr>

pkgname=pingstats
pkgver=1.1.3
pkgrel=1
pkgdesc="A tool to ping a server and make plots with ping's data"

arch=('any')
url="http://www.art-software.fr"
license=('GPL2')

depends=('bash' 'fping' 'coreutils' 'sed' 'gnuplot' 'traceroute')

source=("http://www.art-software.fr/files/archive/stats-${pkgver}.tar.xz")
md5sums=('fb12242ce69b89913698d2910e9ea80f')

package() {
	cd "${srcdir}/stats-${pkgver}"

	mkdir -pv "${pkgdir}/usr/bin"
	mkdir -pv "${pkgdir}/usr/share/pingStats"
	mkdir -pv "${pkgdir}/usr/share/man/man1"
	chmod -R 0755 "${pkgdir}/usr"

	cp stats.sh "${pkgdir}/usr/bin/stats_ping"
	cp stats.plot "${pkgdir}/usr/share/pingStats/stats.plot"
	cp stats_man.gz "${pkgdir}/usr/share/man/man1/stats_ping.1.gz"

	chmod 0755 "${pkgdir}/usr/bin/stats_ping"
	chmod 0644 "${pkgdir}/usr/share/pingStats/stats.plot"
	chmod 0644 "${pkgdir}/usr/share/man/man1/stats_ping.1.gz"
}
