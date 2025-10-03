# Maintainer: Max von Forell <aur at vonforell dot de>

pkgname=dracut-iwd
pkgver=1.0
pkgrel=1
pkgdesc='Dracut module to provide wireless internet access to initramfs'
arch=(any)
url="https://git.sr.ht/~mvforell/$pkgname"
license=('MIT')
depends=('dracut' 'systemd' 'iwd')
provides=("$pkgname")
conflicts=("$pkgname")
source=("$url/archive/$pkgver.tar.gz")
sha256sums=('309753ed2d566ed6266039e06d301eb884aeffeb1d99e6e51270053d0fd9c263')

package() {
	cd "$pkgname-$pkgver"

	target="$pkgdir/usr/lib/dracut/modules.d/30iwd"
	install -Dt "$target" -m 0755 30iwd/module-setup.sh
	install -Dt "$target" -m 0644 30iwd/iwd.service
	install -Dt "$target" -m 0644 30iwd/iwd-dbus.conf
}
