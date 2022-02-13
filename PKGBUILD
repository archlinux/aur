# Maintainer: lemen <les_lemen@ymail.com>

pkgname=weblog_parse
pkgver=20141202 #02Dec2014
pkgrel=1
pkgdesc="extract specified fields from a web log file"
arch=(x86_64 armv6h)
url="http://www.acme.com/software/weblog_parse/"
license=('BSD')
depends=()
makedepends=()
source=(
	"https://www.acme.com/software/weblog_parse/${pkgname}_02Dec2014.tar.gz"
	LICENSE
)
sha256sums=(
	c33351a58609fd01c7c62f5a1de4079268657576466dafe4ccaf0b9ecd392d59
	0340578cf6004ddd556815506165f52882342078a66f4550229fe55874bfec73
)

build() {
	cd "$srcdir/$pkgname/"
	make
}

package() {
	install -Dm 755 "$srcdir/$pkgname/weblog_parse" "$pkgdir/usr/bin/weblog_parse"
	install -Dm 644 "$srcdir/$pkgname/weblog_parse.1" "$pkgdir/usr/share/man/man1/weblog_parse.1"
	install -Dm 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
