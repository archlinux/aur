# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=passless-boot
pkgver=0.2.1
pkgrel=1
pkgdesc="Perform a one-time password-less reboot on a luks encrypted root"
arch=('any')
url="https://gitlab.com/Marcool04/reboot-hdpassless/"
license=('GPL')
depends=(cryptsetup grub)
source=("https://gitlab.com/Marcool04/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('adba4259fb84006d53aad33fc4f3a1fd8db2173e153ca7c40fca2c22d063bf5f')


package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/systemd/system/"
	cp passless-boot_post_boot_cleanup.service "$pkgdir/etc/systemd/system"
	cp passless-boot.sh passless-boot_post_boot_cleanup.sh "$pkgdir/usr/bin"
	chmod +x passless-boot.sh passless-boot_post_boot_cleanup.sh
}
