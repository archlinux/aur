
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid-bin
_pkgname=${pkgname%-*}
pkgver=1.7.5
pkgrel=2
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
provides=('gmid')
conflicts=('gmid' 'gmid-git')
depends=('libretls')
source=(
	"https://github.com/omar-polo/$_pkgname/releases/download/$pkgver/$_pkgname-$pkgver-binaries.tar.gz"
	"https://raw.githubusercontent.com/omar-polo/$_pkgname/$pkgver/LICENSE"
)
sha256sums=(
	'97009f8acdc81c1202dd14dfdcaea8e3fd99983ff1e0e4711258d3e75f49ecdc'
	'f82c1fa80d35427d109a77ed59ecda41474ef46539238750876702fa40579f9f'
)

package() {
	cd "$srcdir"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"

	cd "$_pkgname-$pkgver-binaries"
	install -Dm755 "$_pkgname.linux.amd64" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 gmid.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
