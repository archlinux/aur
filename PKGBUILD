# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=passless-boot
pkgver=0.4.1
pkgrel=1
pkgdesc="Perform a one-time password-less reboot on a luks encrypted root"
arch=('any')
url="https://gitlab.com/Marcool04/reboot-hdpassless/"
license=('GPL')
depends=("cryptsetup")
optdepends=("reboot-guard") # this is in the AUR

source=("https://gitlab.com/Marcool04/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('7ad0ef5bc89cc588417ebfa795f125c3e668c6de59e2fe5989ba341988cd9b78')


package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/etc/systemd/system/"
	chmod +x passless-boot.sh passless-boot_post_boot_cleanup.sh
	cp passless-boot_post_boot_cleanup.service "$pkgdir/etc/systemd/system"
	cp passless-boot.sh passless-boot_post_boot_cleanup.sh "$pkgdir/usr/bin"
}
