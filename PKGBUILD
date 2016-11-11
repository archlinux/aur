# Maintainer: surefire@cryptomile.net

pkgname=tor-torrc.d
pkgdesc='Collects separate configurations from /etc/tor/torrc.d/*.torrc into a single torrc before running tor service'
pkgver=1
pkgrel=1
arch=('any')
license=('MIT')
depends=('tor')
options=('emptydirs')
source=('torrc.d.conf')

sha256sums=('88bc63f86362f34f3dc9fafe5c2d0210e59b3f072af8735da6cd484c04fb75c4')

package() {

	install -dm755 "${pkgdir}/etc/tor/torrc.d"

	install -Dm644 -t "${pkgdir}/usr/lib/systemd/system/tor.service.d" torrc.d.conf
}
