
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid-bin
_pkgname=${pkgname%-*}
pkgver=1.7.5
pkgrel=1
pkgdesc='Fast Gemini server written with security in mind.'
arch=('x86_64')
url='https://gmid.omarpolo.com'
license=('ISC')
provides=('gmid')
conflicts=('gmid' 'gmid-git')
depends=('libretls')
source=(
	"https://github.com/omar-polo/$_pkgname/releases/download/$pkgver/$_pkgname.linux.amd64"
	"https://raw.githubusercontent.com/omar-polo/$_pkgname/$pkgver/gmid.1"
	"https://raw.githubusercontent.com/omar-polo/$_pkgname/$pkgver/LICENSE"
	"https://raw.githubusercontent.com/omar-polo/$_pkgname/$pkgver/README.md"
)
sha256sums=(
	'b9b5fd01503f9f053e08de3fe38deeffa19c4770e2ae975bb2b9ea58a4a78629'
	'4950287661a3ee2970e337f18ad769821633b73799438d15a0aa90a9775700cd'
	'f82c1fa80d35427d109a77ed59ecda41474ef46539238750876702fa40579f9f'
	'425308363e30b4fa0d2fdd321d20070816ce856fe55c8a4654ebd1fd3ad7a23f'
)

package() {
	cd "$srcdir"
	install -Dm755 "$_pkgname.linux.amd64" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 gmid.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
