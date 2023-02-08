# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=passless-boot
pkgver=0.1.1
pkgrel=1
pkgdesc="Perform a one-time password-less reboot on a luks encrypted root"
arch=('any')
url="https://gitlab.com/Marcool04/reboot-hdpassless/"
license=('GPL')
depends=(cryptsetup grub)
source=("https://gitlab.com/Marcool04/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('13e942a1c136a12da2d73696919bc57c37d111130df56964dbc74edca252f400')


package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/systemd/system/"
	cp passless-boot_post_boot_cleanup.service passless-boot.target "$pkgdir/etc/systemd/system"
	cp passless-boot.sh passless-boot_post_boot_cleanup.sh "$pkgdir/usr/bin"
	chmod +x passless-boot.sh passless-boot_post_boot_cleanup.sh
}
