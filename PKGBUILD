# Maintainer: Daniel Peukert <daniel@peukert.cc>
# Contributor: John Lane <archlinux at jelmail dot com>
pkgname='railway-sans-font'
pkgver='20170421'
pkgrel='7'
pkgdesc="An open source version of Edward Johnston's Timeless Typeface for London Underground of 1916"
arch=('any')
url='https://www.ffonts.net/Railway-Semibold.font'
license=('OFL-1.1-RFN')
checkdepends=('fontconfig')
source=(
	"$pkgname-$pkgver.zip::$url.zip"
	'LICENSE'
)
sha512sums=('8f94b1ab77975e70f4795261f63d59c9400a24f53a48e9cc385f39ae990812fa466064e2ab246286baa5a4b78cff806501fddfcc2cb4f5d6131c22e2c184c3c2'
            'e744197e9e025386ad76a5b05564f1c0c0626da7f2febe19cceae8bbcfcc483e913c55ba13729f36a7f1a947d5c357e56b6b6a9ba895b94b6baff0833f7a3ace')

check() {
	_checkoutput="$(fc-scan "$srcdir/"{'O','T'}'TF/'*)"
	printf '%s\n' "$_checkoutput"
	printf '%s\n' "$_checkoutput" | grep -q 'family: "Railway'
}

package() {
	cd "$srcdir/"
	install -dm755 "$pkgdir/usr/share/fonts/"{'O','T'}'TF'
	install -Dm644 'OTF/'*'.otf' "$pkgdir/usr/share/fonts/OTF/"
	install -Dm644 'TTF/'*'.ttf' "$pkgdir/usr/share/fonts/TTF/"
	install -Dm644 'LICENSE' "$pkgdir/usr/share/licenses/$pkgname/OFL-1.1-RFN"
}
