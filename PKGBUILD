# Maintainer: Heptazhou <zhou at 0h7z dot com>
# Contributor: ifaigios <ifaigios_at_gmail_dot_com>
# Contributor: Alyssa Hung <deciare@isisiew.org>
# Contributor: Matt Brennan
# Contributor: falconindy
# Contributor: adee
# Contributor: mystilleef
# Contributor: Radek Podgorny <radek@podgorny.cz>

pkgname=zramswap
pkgver=7
pkgrel=2
pkgdesc="Sets up zram-based swap devices on boot"
arch=("any")
url="https://en.wikipedia.org/wiki/Zram"
license=("GPL")
depends=("bash")
backup=("etc/zramswap.conf")
source=(
	"zramctrl"
	"zramswap.conf"
	"zramswap.service"
)
md5sums=(
	"fb633774fb523b7107ca62b2647aec89"
	"2137bd73c7d87a6ded0011a8f27f478e"
	"a746969adc521826c14b0796968f3ca6"
)

package() {
	install -Dm755 zramctrl $pkgdir/usr/lib/systemd/scripts/zramctrl
	install -Dm644 zramswap.conf $pkgdir/etc/zramswap.conf
	install -Dm644 zramswap.service $pkgdir/usr/lib/systemd/system/zramswap.service
}
