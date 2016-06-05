pkgname=afraiddns-git
pkgver=0
pkgrel=1
pkgdesc="Service to update a subdomain reserved through afraid.org."
url="https://github.com/mar77i/afraiddns"
arch=(any)
license=('ISC')
depends=('curl')
install="${pkgname}.install"
source=("git+https://github.com/mar77i/afraiddns")
sha1sums=(SKIP)

build() {
	:
}

package() {
	cd "$srcdir/afraiddns"
	install -m644 -D "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
	install -m644 -D "afraiddns.service" \
		"${pkgdir}/usr/lib/systemd/system/afraiddns.service"
	install -m644 -D "afraiddns.timer" \
		"${pkgdir}/usr/lib/systemd/system/afraiddns.timer"
	install -m755 -D "afraiddns" "${pkgdir}/usr/bin/afraiddns"
}
