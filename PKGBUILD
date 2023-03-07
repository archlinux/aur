# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=passless-boot
pkgver=0.3.1
pkgrel=1
pkgdesc="Perform a one-time password-less reboot on a luks encrypted root"
arch=('any')
url="https://gitlab.com/Marcool04/reboot-hdpassless/"
license=('GPL')
depends=(cryptsetup reboot-guard)
source=("https://gitlab.com/Marcool04/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('9630f74064d08bd80ee92d61c3f07cadbd667014b5d4069cfc11ae66f532a221')


package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/systemd/system/"
	cp passless-boot_post_boot_cleanup.service "$pkgdir/etc/systemd/system"
	cp passless-boot.sh passless-boot_post_boot_cleanup.sh "$pkgdir/usr/bin"
	chmod +x passless-boot.sh passless-boot_post_boot_cleanup.sh
}
