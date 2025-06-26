# Maintainer: Stikkot
pkgname=app-opener
pkgver=v1
pkgrel=5
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
sha256sums=('b6c8ef6be0c0f2f26d830540ed1679fb2f5bf41c7b871a774c4f47a8d6965f71'
            '9fffc3973f97414b2b85bed6e58506f1c7289fcb350cc2adf56f4deef91bdc6d'
            'b688cb2088e9cd2f2c47b27774c1f3df614943ab3fb7ab3443a6998d5ce122aa'
            'e258c3e566f70a09a5b410d669dab45e8e0ff15ed3a82818c6e649fe7e2b8fd6'
            '6e77933c7979815985919ded8cac7612003e2ae4b25f541229111c19e05b6aed'
            'ad2bc6b605f507834fa2765eb54e97a492b02fd4e2c8177339165b652a95407f'
            'a507af0cb04bd75b80d24db6f405150cfc6063ab7b950333adf97317721f17ff')

package() {
	mkdir -p "$pkgdir/usr/share/${pkgname}"
	mkdir -p "$pkgdir/usr/share/${pkgname}/apps"
	mkdir -p "$pkgdir/usr/share/${pkgname}/scripts"
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
