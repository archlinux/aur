# Maintainer: pancho horrillo <pancho at pancho dot name>

pkgname=the_platinum_searcher-bin
pkgdesc='A code search tool similar to ack, the_silver_searcher (ag) and ripgrep (rg).'
pkgver=2.1.6
pkgrel=1
arch=('x86_64')
url='https://github.com/monochromegane/the_platinum_searcher'
license=('MIT')
depends=('glibc')
provides=('the_platinum_searcher')
conflicts=('the_platinum_searcher')
source_x86_64=(
	"https://github.com/monochromegane/the_platinum_searcher/releases/download/v$pkgver/pt_linux_amd64.tar.gz"
	LICENSE
)
sha512sums_x86_64=(
	'8bf310ca2508dafb761156e6b27dd7d71619df459012821bae42c4752dc58407809491e68db433ae48c252a81a00007f2634f2e752b993d8b86953ee45569bad'
        '58a1456e4267dc43f7e68071b6077c91516f576060d9a2fb645e47015adfc2dbffcae43e2ca81148bd1e0f0cae2cbe7ef2e147646579ed98bfaa44aa86c95680'
)

package() {
	msg 'Installing pt binary...'
	install -Dm 755 "$srcdir/pt_linux_amd64/pt"         "$pkgdir/usr/bin/pt"

	msg 'Installing README...'
	install -Dm 644 "$srcdir/pt_linux_amd64/README.md"  "$pkgdir/usr/share/doc/${pkgname/-bin}/README.md"

	msg 'Installing LICENSE...'
	install -m 644 -D LICENSE                           "$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
}
