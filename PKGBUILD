# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=passless-boot
pkgver=0.5.0
pkgrel=1
pkgdesc="Perform a one-time password-less reboot on a luks encrypted root"
arch=('any')
url="https://gitlab.com/Marcool04/reboot-hdpassless/"
license=('GPL')
depends=("cryptsetup")
optdepends=("reboot-guard") # this is in the AUR

source=("https://gitlab.com/Marcool04/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('96e0bb5f4bd505c6dd1e8403257e8f5623318ad1485d5797a13536ca2da811e9')


package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/systemd/system/"
	chmod +x passless-boot.sh passless-boot_post_boot_cleanup.sh
	cp passless-boot_post_boot_cleanup.service "$pkgdir/etc/systemd/system"
	cp passless-boot.sh passless-boot_post_boot_cleanup.sh "$pkgdir/usr/bin"
}
