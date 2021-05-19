# Maintainer: Glen D'souza <gdsouza@linuxmail.org>
# Maintainer: aimileus <me at aimileus dot nl>
pkgname=fedora-arm-installer
_pkgname=arm-image-installer
pkgver=3.4
pkgrel=1
pkgdesc="Script to automate the installation of Fedora on ARM boards"
arch=('any')
url="https://pagure.io/arm-image-installer"
license=('GPL')
depends=('bash' 'e2fsprogs' 'parted' 'util-linux')
makedepends=('git')
source=("https://pagure.io/$_pkgname/archive/$_pkgname-$pkgver/$_pkgname-$_pkgname-$pkgver.tar.gz")
sha512sums=('64b6fe9f0176124136c88ac2e95963172d115b9a52cae0a36761a6478ddeca2a984ba9459578d13b92414c63159443b646e8bdcb8f9d80cc7a2591dd1209626b')

package() {
	cd "$_pkgname-$_pkgname-$pkgver"
	install -Dm644 socs.d/* -t "$pkgdir/usr/share/arm-image-installer/socs.d"
	install -Dm644 boards.d/* -t "$pkgdir/usr/share/arm-image-installer/boards.d"
	install -Dm755 update-uboot -t "$pkgdir/usr/bin/"
	install -Dm755 arm-image-installer -t "$pkgdir/usr/bin/"
	install -Dm755 rpi-uboot-update -t "$pkgdir/usr/bin/"
}
