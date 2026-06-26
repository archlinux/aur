# Maintainer: nezu <nezu@nezu.cc>
pkgname=avrasm2
pkgver=2.2.8.80
pkgrel=1
pkgdesc="AVR Assembler"
arch=(x86_64)
url="https://forum.microchip.com/s/topic/a5C3l000000BqmjEAC/t391924"
license=('unknown')
makedepends=('xz')
source=(
	"avr-assembler-public-2.2.8.80-linux.any_.x86_64.tar.gz::https://forum.microchip.com/sfc/servlet.shepherd/document/download/0693l00000adH4HAAU"
	"avrasm2.sh"
	"inc.tar.xz")
sha256sums=('1f9bf87b0f881b56177ac1225022c956987dc6ef3e31cfdec98784ea3823d0e1'
            '4d5f6a0f8fb458112287a91ed34695f9458fbfc4ff2b4a61f1769d564106626c'
            '3ada1ccf5e4642ec9a7f1042a47207bf7250b62141fec12007c50cb38dc1e8f7')
options=('!strip' '!debug')

package() {
	install -Dm755 $pkgname "$pkgdir/usr/lib/$pkgname"
	install -Dm755 $pkgname.sh "$pkgdir/usr/bin/$pkgname"
	find inc -type f -exec install -Dm644 "{}" "$pkgdir/usr/share/$pkgname/{}" \;
}
