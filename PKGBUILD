# Maintainer: Tom Stroobants <stroobantstom@gmail.com>
pkgname=duckdns
pkgver=1.0.1
pkgrel=1
pkgdesc="Update your DuckDNS.org entries from your computer without setting up any cronjob. You just need to create config files for your domains."
arch=('any')
install=${pkgname}.install
url="https://www.duckdns.org"
backup=("etc/duckdns.d/default.cfg")

source=('default.cfg' 'duckdns.service' 'duckdns.timer' 'duckdns.sh')
md5sums=('4cad7ae6c25b8148916fc702f4846a6f'
         'b478880b19c7c403c8f8b2e80292c789'
         '891ca4358eca8d9c2c1994aa3025fa04'
         '1bcd62ec5cec5ca5618d2dd2901c66e1')


package() {
	
	install -D duckdns.sh "${pkgdir}/usr/bin/${pkgname}"

	install -d "${pkgdir}/etc/duckdns.d/"

	install -Dm644 default.cfg "${pkgdir}/etc/duckdns.d/default.cfg"

	install -Dm644 duckdns.service "${pkgdir}/usr/lib/systemd/system/duckdns.service"
	install -Dm644 duckdns.timer "${pkgdir}/usr/lib/systemd/system/duckdns.timer"


}

