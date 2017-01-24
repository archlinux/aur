pkgname=lua-iconv
pkgver=7
pkgrel=2
pkgdesc="Lua bindings for the iconv API"
arch=('i686' 'x86_64')
url="http://ittner.github.com/lua-iconv/"
license=('custom')
depends=('lua')
conflicts=()
source=(
	"https://github.com/downloads/ittner/lua-iconv/lua-iconv-$pkgver.tar.gz"
	"https://github.com/downloads/ittner/lua-iconv/lua-iconv-$pkgver.tar.gz.sig"
)
sha512sums=(
	'03b537ba6050ca8e59e6a62474e837c0d6463d1da4610e6da820afc573659571f75de0c7507792e8b7348fd91623d7af7050ead18bd09ec0c7b89a742e024a57'
	'SKIP'
)
validpgpkeys=('9B49FCE2E6B9D1AD610129AD4F6DF1140041A1FB') # Alexandre Erwin Ittner <FIRST_NAME@LAST_NAME.com.br>

build() {
	cd "$srcdir/lua-iconv-$pkgver"
	make LUAPKG=lua53
}

package() {
	cd "$srcdir/lua-iconv-$pkgver"
	install -Dm0644 iconv.so "$pkgdir/usr/lib/lua/5.3/iconv.so"
	install -Dm0644 README   "$pkgdir/usr/share/doc/$pkgname/README"
	install -Dm0644 COPYING  "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}

