# Maintainer: WithTheBraid <the-one@with-the-braid.cr>
pkgname=yubihibernate
pkgver=0.1.4
pkgrel=1
pkgdesc="Hibernate (or whatever) your computer as soon as your Yubikey is unplugged."
url="https://gitlab.com/TheOneWithTheBraid/yubihibernate/"
arch=(any)
license=('EUPL-1.2')
depends=('usbutils')
backup=('etc/yubihibernate/device.conf')
source=("https://gitlab.com/TheOneWithTheBraid/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=("d48d9883d5beec8124a3deb6a899a5843b3f2c057f2a859aadaae21f63b19153")

package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin" "$pkgdir/etc/systemd/system"
	make DESTDIR="$pkgdir" install
}
