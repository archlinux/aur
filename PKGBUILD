# Maintainer: pancho horrillo <pancho at pancho dot name>

pkgname=the_platinum_searcher-bin
pkgdesc='A code search tool similar to ack, the_silver_searcher (ag) and ripgrep (rg).'
pkgver=2.2.0
pkgrel=1
arch=('x86_64')
url='https://github.com/monochromegane/the_platinum_searcher'
license=('MIT')
provides=('the_platinum_searcher')
conflicts=('the_platinum_searcher')
source_x86_64=(
	"$url/releases/download/v$pkgver/pt_linux_amd64.tar.gz"
	LICENSE
)
sha512sums_x86_64=('bb0da7b89b5c0c079588c1f3a0e755db0aeac189b676b8df1fa756bff13121e06e61f747c86cd22c92928db22db45b175155cd09b82ff87b289e83581a07c3e4'
                   '58a1456e4267dc43f7e68071b6077c91516f576060d9a2fb645e47015adfc2dbffcae43e2ca81148bd1e0f0cae2cbe7ef2e147646579ed98bfaa44aa86c95680')

package() {
	msg 'Installing pt binary...'
	install -Dm755 "$srcdir/pt_linux_amd64/pt"		"$pkgdir/usr/bin/pt"

	msg 'Installing README...'
	install -Dm644 "$srcdir/pt_linux_amd64/README.md"	"$pkgdir/usr/share/doc/${pkgname/-bin}/README.md"

	msg 'Installing LICENSE...'
	install -Dm644 LICENSE					"$pkgdir/usr/share/licenses/${pkgname/-bin}/LICENSE"
}
