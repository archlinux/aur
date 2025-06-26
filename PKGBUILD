# Maintainer: Stikkot
pkgname=app-opener
pkgver=v1
pkgrel=6
pkgdesc="Complex for open applications and start scripts..."
arch=('any')
url="https://github.com/stikundra-murtsi/app-opener"
license=('custom:NAUPL')
depends=('bash')

source=(
	"app-opener.sh"
	"list.sh"
	"recovery.sh"
	"remove.sh"
	"setup.sh"
	"LICENSE"
	"README.md"
)
sha256sums=('09001345dba196c8308c9ba16aa20b53b11f74735f4d8122433168170b8b1cea'
            'd417dce80618596ded1a24e0bd50f280d16bab608c6d488ced2767cdd7ccf1d0'
            'b688cb2088e9cd2f2c47b27774c1f3df614943ab3fb7ab3443a6998d5ce122aa'
            '405eabcaef114fae58b843f51690249bb3679cdf113e165421e59d36b8d4f37f'
            'b8f5c5864931b44061a04d87b35cdf20d3d57246e10a4d7bcfbd7449f121937c'
            'ad2bc6b605f507834fa2765eb54e97a492b02fd4e2c8177339165b652a95407f'
            'a507af0cb04bd75b80d24db6f405150cfc6063ab7b950333adf97317721f17ff')

package() {
	mkdir -p "$pkgdir/usr/share/${pkgname}"
	mkdir -p "$pkgdir/usr/bin"

	install -Dm755 "${srcdir}/app-opener.sh" "$pkgdir/usr/share/${pkgname}/app-opener.sh"
	install -Dm755 "${srcdir}/list.sh" "$pkgdir/usr/share/${pkgname}/list.sh"
	install -Dm755 "${srcdir}/recovery.sh" "$pkgdir/usr/share/${pkgname}/recovery.sh"
	install -Dm755 "${srcdir}/remove.sh" "$pkgdir/usr/share/${pkgname}/remove.sh"
	install -Dm755 "${srcdir}/setup.sh" "$pkgdir/usr/share/${pkgname}/setup.sh"
	install -Dm644 "${srcdir}/LICENSE" "$pkgdir/usr/share/licenses/${pkgname}/LICENSE"
	install -Dm644 "${srcdir}/README.md" "$pkgdir/usr/share/doc/${pkgname}/README.md"

	ln -sf "/usr/share/${pkgname}/app-opener.sh" "$pkgdir/usr/bin/app"
}
