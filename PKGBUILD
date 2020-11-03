# Maintainer: Glen D'souza <gdsouza@linuxmail.org>
# Maintainer: aimileus <me at aimileus dot nl>
pkgname=fedora-arm-installer
_pkgname=arm-image-installer
pkgver=3.0
pkgrel=1
pkgdesc="Script to automate the installation of Fedora on ARM boards"
arch=('any')
url="https://pagure.io/arm-image-installer"
license=('GPL')
depends=('bash' 'e2fsprogs' 'parted' 'util-linux')
makedepends=('git')
source=("https://pagure.io/$_pkgname/archive/$_pkgname-$pkgver/$_pkgname-$_pkgname-$pkgver.tar.gz")
sha512sums=('6f2a586d4de30bc7d3cf7410f2d702692ea35c4cc13d91bf3591a9ea00e0e235bc1926e2ef0b3266c8824fe058d28d36586973f77db67da94750e287d79e75ef')

package() {
	cd "$_pkgname-$_pkgname-$pkgver"
	install -Dm644 socs.d/* -t "$pkgdir/usr/share/arm-image-installer/socs.d"
	install -Dm644 boards.d/* -t "$pkgdir/usr/share/arm-image-installer/boards.d"
	install -Dm755 update-uboot -t "$pkgdir/usr/bin/"
	install -Dm755 arm-image-installer -t "$pkgdir/usr/bin/"
	install -Dm755 rpi-uboot-update -t "$pkgdir/usr/bin/"
}
