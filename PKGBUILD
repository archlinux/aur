
# Maintainer: Andrea Feletto <andrea@andreafeletto.com>

pkgname=gmid-bin
_pkgname=${pkgname%-*}
pkgver=1.7.2
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
	'f141058d9ec6930b97a67556dc80178ef346d4a7228e0fbaca1afb3dbd44f798'
	'25b39eda4bbf94b8b9e5e04d156ef0bd2a63994766186eaf12aeeb40802571cd'
	'f82c1fa80d35427d109a77ed59ecda41474ef46539238750876702fa40579f9f'
	'a5917d6f3e0a56612fdae554ed26993282d872a4a8655bcfa9289c9d270e418c'
)

package() {
	cd "$srcdir"
	install -Dm755 "$_pkgname.linux.amd64" "$pkgdir/usr/bin/$_pkgname"
	install -Dm644 gmid.1 -t "$pkgdir/usr/share/man/man1"
	install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$_pkgname"
	install -Dm644 README.md -t "$pkgdir/usr/share/doc/$_pkgname"
}
