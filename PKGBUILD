# Maintainer: Amorphous Xubstance <sorairoyorimitsu@proton.me>
pkgname='alarmng'
pkgver=0.9.0
pkgrel=1
pkgdesc="Light & fast TUI alarm clock using systemd.timer (includes alarm track)"
arch=('any')
url="https://github.com/AmorphousXubstance/alarmng"
license=('GPL3' 'custom:CC BY 4.0')
depends=('python' 'pipewire')
source=("alarmng-v$pkgver.tar.gz::https://github.com/AmorphousXubstance/alarmng/releases/download/Release_v0.9.0/alarmng-v$pkgver.tar.gz")
sha256sums=('fad38b9afa8000a59d8d5ecdbb3ffdbc420a5f6cb4c7f698266ef6b9d4c293b1')

package() {
	cd "$srcdir"

	install -Dm755 alarmng "$pkgdir/usr/bin/alarmng"
	install -Dm755 almngine "$pkgdir/usr/lib/alarmng/almngine"
	install -Dm644 alarmng.service "$pkgdir/usr/lib/systemd/user/alarmng.service"
	install -Dm644 alarmng.timer "$pkgdir/usr/lib/systemd/user/alarmng.timer"
	install -Dm644 alarmng.conf "$pkgdir/etc/alarmng.conf"
	install -Dm644 'Sleeping Bees.wav' "$pkgdir/usr/share/sounds/alarmng/Sleeping Bees.wav"
	install -Dm644 LICENSE "$pkgdir/usr/share/licenses/alarmng/LICENSE"
	install -Dm644 LICENSE-ASSETS "$pkgdir/usr/share/licenses/alarmng/LICENSE-ASSETS"
	install -Dm644 alarmng.1 "$pkgdir/usr/share/man/man1/alarmng.1"
}
