# Maintainer: Tom Stroobants <stroobantstom@gmail.com>
pkgname=duckdns
pkgver=1.0.0
pkgrel=1
pkgdesc="Update your DuckDNS.org entries from your computer without setting up any cronjob. You just need to create config files for your domains."
arch=('any')
url="https://stroobants.io"
license=('MIT')
backup=("etc/duckdns.d/default.cfg")

source=("https://stroobants.io/wp-content/uploads/2015/09/${pkgname}-${pkgver}.tar.gz")
md5sums=('78ea999eaa92e8b005464ca37544cf62')

package() {
	cd ${pkgname}
	
	install -D duckdns.sh "${pkgdir}/usr/bin/${pkgname}"
	install -D LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"

	install -d "${pkgdir}/etc/duckdns.d/"

	install -Dm644 default.cfg "${pkgdir}/etc/duckdns.d/default.cfg"

	install -Dm644 duckdns.service "${pkgdir}/usr/lib/systemd/system/duckdns.service"
	install -Dm644 duckdns.timer "${pkgdir}/usr/lib/systemd/system/duckdns.timer"


}
