# Maintainer: Sijmen Schoon <me@sijmenschoon.nl>
pkgname=kick-assembler
pkgver=5.9
pkgrel=1
epoch=
pkgdesc="Advanced MOS 65XX assembler"
arch=("any")
url="http://www.theweb.dk/KickAssembler/"
license=("unknown")
depends=("bash" "java-runtime")
source=(
	"http://www.theweb.dk/KickAssembler/KickAssembler$pkgver.zip"
	"kickass"
)
noextract=("KickAssembler$pkgver.zip")
md5sums=(
	'04449e2a3db2105a708124efe5c9b87a'
	'275e9754426ec0063ed7b2219063cbe4'
)

prepare() {
	mkdir -p "kick-assembler"
	bsdtar xf "KickAssembler$pkgver.zip" -C "kick-assembler"
}

package() {
	mkdir -p "$pkgdir/usr/share/java" "$pkgdir/usr/bin"
	cp -r "kick-assembler" "$pkgdir/usr/share/java/"
	install kickass "$pkgdir/usr/bin"
}
