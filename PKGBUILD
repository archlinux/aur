# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: John Lane <archlinux at jelmail dot com>
pkgname='railway-sans-font'
pkgver='20170421'
pkgrel='8'
pkgdesc="An open source version of Edward Johnston's Timeless Typeface for London Underground of 1916"
arch=('any')
url='https://www.ffonts.net/Railway-Semibold.font'
license=('OFL-1.1-RFN')
checkdepends=('fontconfig')
source=(
	"$pkgname-$pkgver.zip::$url.zip"
	'LICENSE'
)
b2sums=('7334af177dbf32427fc411e2355cb659c6b64ad3c06a2522f18cdb45f562b79e0885dfbbea1a5790f5ddaf41c26f960617548bb48aa880704d27743fe136d805'
        'be49b9f318177caa8944438307bf956b6d03b8d69dc3a528bd6fc64020e02e715ab518d8ed9761fa144f41487ea1fc3638fb7b3288653f69ea310daa1b9db3ae')

check() {
	_checkoutput="$(fc-scan "$srcdir/"{'O','T'}'TF/'*)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q 'family: "Railway'
}

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/share/fonts/"{'O','T'}"TF/$pkgname/"
	install -Dm644 'OTF/'*'.otf' "$pkgdir/usr/share/fonts/OTF/$pkgname/"
	install -Dm644 'TTF/'*'.ttf' "$pkgdir/usr/share/fonts/TTF/$pkgname/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/OFL-1.1-RFN"
}
