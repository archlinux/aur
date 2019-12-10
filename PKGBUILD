# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=battery-monitor
pkgver=0.6
pkgrel=10
pkgdesc='A utility tool, notifies user about charging, discharging and not
         charging state of the battery on Linux.'
arch=('any')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('acpi' 'python-gobject' 'libnotify' 'libappindicator-gtk3')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('e086efa3d9bdfc521a57510c637c6bf772587b04b60119485d880864a3918b1f')

package() {
	cd "$pkgname-$pkgver"
	install -d "$pkgdir/"usr/{bin,share/battery-monitor}
	cp -a src/. "$pkgdir/usr/share/$pkgname"
	install -Dm755 "$pkgname" "$pkgdir/usr/bin/$pkgname"
	install -Dm644 "$pkgname-autostart.desktop" -t "$pkgdir/etc/xdg/autostart"
	install -Dm644 "$pkgname.desktop" -t "$pkgdir/usr/share/applications"
}
