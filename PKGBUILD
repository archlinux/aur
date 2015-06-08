# Maintainer: Sonic-Y3k <sonic.y3k@goolemail.com>

pkgname=intel_nuc_apple_remote
pkgver=1.0
pkgrel=1
pkgdesc="Reconfigure Intel NUCs IR-Receiver to get Apple Remote (A1294) input and pass it to Kodi."
arch=('any')
url="https://forums.plex.tv/index.php/topic/103833-definitive-intel-nuc-how-to-guide-surround-sound-over-hdmi-apple-remote-graphics/"
license=('GPL')
depends=('lirc')
source=("apple_remote_sab"
	"make-ir-freaking-work.service")
md5sums=("b7767bf1c5a36685c5535276ab13e3f5"
	 "cac9b93d10fe5566f19da74ff53c06f7")
install="intel_nuc_apple_remote.install"

package() {
	cd "$srcdir"
	mkdir -p "$pkgdir/etc/rc_keymaps"
	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	install -Dm 644 apple_remote_sab "$pkgdir/etc/rc_keymaps"
	install -Dm 644 make-ir-freaking-work.service "$pkgdir/usr/lib/systemd/system/"
}
