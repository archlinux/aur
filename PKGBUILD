
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope-bin
_pkgname=${pkgname%-*}
pkgver=0.5.1
pkgrel=1
pkgdesc='w3m-like browser for Gemini.'
arch=('x86_64')
url='https://telescope.omarpolo.com'
license=('ISC')
provides=('telescope')
conflicts=('telescope' 'telescope-git')
depends=('libretls')
source=(
	"https://github.com/omar-polo/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-binaries.tar.gz"
	'https://raw.githubusercontent.com/omar-polo/telescope/main/LICENSE'
)
sha256sums=(
	'41a05ecfa3db88e3131440859a043ce7c5c1106229d312c9d78dc5da5a6ed571'
	'd74e569d89bef32bc5b9b297e581022674b62e4f9317fa72b971947f9e7ecd67'
)

package() {
	cd "$srcdir"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"

	cd "$_pkgname-$pkgver-binaries"
	install -Dm755 "$_pkgname.linux.amd64" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 telescope.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
