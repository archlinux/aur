# Maintainer: surefire@cryptomile.net

pkgname=tor-torrc.d
pkgdesc='Collects separate configurations from /etc/tor/torrc.d/*.torrc into a single torrc before running tor service'
pkgver=1
pkgrel=2
arch=('any')
license=('MIT')
depends=('tor')
options=('emptydirs')
source=('torrc.d.conf')

sha256sums=('8b9bb8b72bbbadce6354c6fcb814dc586e4bb3963f72d187d5f8cdc49e12e104')

package() {

	install -dm755 "${pkgdir}/etc/tor/torrc.d"

	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/tor.service.d" torrc.d.conf
}
