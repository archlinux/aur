
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=telescope-bin
_pkgname=${pkgname%-*}
pkgver=0.8
pkgrel=2
pkgdesc='w3m-like browser for Gemini.'
arch=('x86_64')
url='https://telescope.omarpolo.com'
license=('ISC')
provides=('telescope')
conflicts=('telescope' 'telescope-git')
source=("https://github.com/omar-polo/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-binaries.tar.gz")
sha256sums=('27623182be33ecb9e099217c5d458b94334436e97ab2f692b2eed2f7c91400b5')

package() {
	cd "$_pkgname-$pkgver-binaries"
	install -Dm755 "$_pkgname.amd64" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 telescope.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
