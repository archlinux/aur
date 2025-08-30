# Maintainer: Stikkot
pkgname=app-opener
pkgver=1.2
pkgrel=1
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
sha256sums=('d6325306c590f12b9ad03e9d40309cfe19540d5208b6562df38d11cff9b9221a'
            'd417dce80618596ded1a24e0bd50f280d16bab608c6d488ced2767cdd7ccf1d0'
            '67616c99765cb1b7bd8ae71b61abba722cb31625564894f1f704b242413c16ce'
            '405eabcaef114fae58b843f51690249bb3679cdf113e165421e59d36b8d4f37f'
            'b8f5c5864931b44061a04d87b35cdf20d3d57246e10a4d7bcfbd7449f121937c'
            '1eee93882484a32ee699f0c7a3f53353fc068db77b1e68acaa2e411d71d9ec3d'
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
