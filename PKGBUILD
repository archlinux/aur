# Maintainer: Mesmer <mesmer@fisica.if.uff.br>
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
         'd6f285cc57f685e1c63a80ff060936eb'
         '891ca4358eca8d9c2c1994aa3025fa04'
         'a2814a1a18af9eaaa6891509b21814c3')


package() {
	
	install -D duckdns.sh "${pkgdir}/usr/bin/${pkgname}"

	install -d "${pkgdir}/etc/duckdns.d/"

	install -Dm644 default.cfg "${pkgdir}/etc/duckdns.d/default.cfg"

	install -Dm644 duckdns.service "${pkgdir}/usr/lib/systemd/system/duckdns.service"
	install -Dm644 duckdns.timer "${pkgdir}/usr/lib/systemd/system/duckdns.timer"


}

