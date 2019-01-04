# Maintainer: Mark Wagie <yochanan dot marqos at gmail dot com>
pkgname=battery-monitor
pkgver=0.6
pkgrel=8
pkgdesc='A utility tool, notifies user about charging, discharging and not charging state of the battery on Linux.'
arch=('any')
url="https://github.com/maateen/battery-monitor"
license=('GPL3')
depends=('acpi' 'python' 'python-gobject' 'libnotify' 'libappindicator-gtk3')
conflicts=('battery-monitor-devel-git')
provides=('battery-monitor')
source=("$url/archive/v$pkgver.tar.gz")
md5sums=('69169d19f98c71c6e76919651133f729')

package() {
	cd "$pkgname-$pkgver"
	install -d “${pkgdir}/usr/{bin,share}/battery-monitor”
	cp -a src/. "${pkgdir}/usr/share/battery-monitor"
	install -Dm755 battery-monitor "${pkgdir}/usr/bin/battery-monitor"
	install -Dm755 battery-monitor-autostart.desktop "${pkgdir}/etc/xdg/autostart/battery-monitor-autostart.desktop"
	install -Dm755 battery-monitor.desktop "${pkgdir}/usr/share/applications/battery-monitor.desktop"
}
