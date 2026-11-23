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
pkgrel=3
pkgdesc="Sets up zram-based swap devices on boot"
arch=("any")
url="https://wiki.archlinux.org/title/Zram"
license=("GPL")
backup=("etc/zramswap.conf")
source=(
	"zramctrl"
	"zramswap.conf"
	"zramswap.service"
)
sha256sums=(
	"fa8306b6110e07c89ac9790252db63f62300eae8bce1953da85d897383f78270"
	"32b88ecc8b9b0d17d2aeb2326316487b210c2e9c5929063ee371c2e862a9c5d8"
	"da2026d7b130b53e9acf41eeb2724e85e0a8f9d0868baae4a462b4a8e6925844"
)

package() {
	install -Dm755 -t "$pkgdir/usr/lib/systemd/scripts/" zramctrl
	install -Dm644 -t "$pkgdir/etc/" zramswap.conf
	install -Dm644 -t "$pkgdir/usr/lib/systemd/system/" zramswap.service
}
