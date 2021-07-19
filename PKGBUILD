
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope-bin
_pkgname=${pkgname%-*}
pkgver=0.3.1
pkgrel=2
pkgdesc='w3m-like browser for Gemini.'
arch=('x86_64')
url='https://telescope.omarpolo.com'
license=('ISC')
provides=('telescope')
conflicts=('telescope' 'telescope-git')
depends=('libretls')
source=("https://github.com/omar-polo/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-binaries.tar.gz")
sha256sums=('65562eed4f9f696c54a2a2178819ed2048c81ac94f33982255884103594ebea8')

package() {
	cd "$srcdir/$_pkgname-$pkgver-binaries"
	install -Dm755 "$_pkgname.linux.amd64" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 telescope.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
