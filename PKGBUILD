# Maintainer: Nitroretro <nitroretro@protonmail.com>

pkgname=duckdns-ipv6
pkgver=1.0
pkgrel=1
pkgdesc="Automatically update DuckDNS domains, with IPv6 support"
arch=("any")
url="https://duckdns.org"
license=("GPL3")
depends=("jq")
provides=("duckdns")
conflicts=("duckdns")
backup=("etc/duckdns.d/default")
install="${pkgname}.install"
source=("duckdns.conf"
	"duckdns.sh"
	"duckdns.service"
	"duckdns.timer")
sha512sums=('e781a69a01a7b590a5435f123d118ef64a111b57440a72e3671f560b4f2afae72f9a28c1766b032c7586fa95ac8b3dc7ea68b861d68571fcd6b3cb09185b7f68'
            '9188d922ec4d3c01f83e9d3880f86e60988c566010e9ec188bb3b86bde76276c84e1e305347ac877e5ee864b5b0c5218a09f09c8021f7bdea1faa1a19f871204'
            'c32206e50a0e29810dbd80fe2f17216ff1b204f0ca4542a18dd444da6eb67e411ee0aab64b31af74cb7b9b43d547a35bf4f76bc215bc409c2be2e002a72e7701'
            'b786e208d40a52592f1f82995cc3c8e65296a107e0f72a51c8d58e58906e3e0a7140b75f0894fa20ce2f814dae0656fc29312100c91e0acc004543c9bac13930')

package() {
	install -Dm600 duckdns.conf "${pkgdir}/etc/duckdns.d/default"
	install -Dm755 duckdns.sh "${pkgdir}/usr/bin/duckdns"
	install -Dm644 duckdns.service "${pkgdir}/usr/lib/systemd/system/duckdns.service"
	install -Dm644 duckdns.timer "${pkgdir}/usr/lib/systemd/system/duckdns.timer"
}
