# Maintainer: Mark Collins <tera_1225 hat hotmail dote com>
pkgname=passless-boot
pkgver=0.5.2
pkgrel=2
pkgdesc="Perform a one-time password-less reboot on a luks encrypted root"
arch=('any')
url="https://gitlab.com/Marcool04/reboot-hdpassless/"
license=('GPL')
depends=("cryptsetup" "bash")
optdepends=("reboot-guard") # this is in the AUR

source=("https://gitlab.com/Marcool04/$pkgname/-/archive/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d156e946fea1ec735158103a07ed66699ea13e615ce8eff382e7351874b6c9f2')


package() {
	cd "$pkgname-$pkgver"
	mkdir -p "$pkgdir/usr/bin"
	mkdir -p "$pkgdir/usr/lib/systemd/system/"
	chmod +x passless-boot.sh passless-boot_post_boot_cleanup.sh
	cp passless-boot_post_boot_cleanup.service "$pkgdir/usr/lib/systemd/system/"
	cp passless-boot.sh passless-boot_post_boot_cleanup.sh "$pkgdir/usr/bin"
}
