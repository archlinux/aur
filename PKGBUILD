# Maintainer: Glen D'souza <gdsouza@linuxmail.org>
# Maintainer: aimileus <me at aimileus dot nl>
pkgname=fedora-arm-installer
_pkgname=arm-image-installer
pkgver=2.13
pkgrel=1
pkgdesc="Script to automate the installation of Fedora on ARM boards"
arch=('any')
url="https://pagure.io/arm-image-installer"
license=('GPL')
depends=('bash' 'e2fsprogs' 'parted' 'util-linux')
makedepends=('git')
source=("https://pagure.io/$_pkgname/archive/$_pkgname-$pkgver/$_pkgname-$_pkgname-$pkgver.tar.gz")
sha512sums=('b23bbe1e6180186d1817a812b0bfcb9f151cec0008bf8e9cf918cdaf009b58785fcae1a9a8d9bdba22e6e18b10374dbbc7e03be4bdbbe1e241c74e90d046eb7a')

package() {
	cd "$_pkgname-$_pkgname-$pkgver"
	install -Dm644 socs.d/* -t "$pkgdir/usr/share/arm-image-installer/socs.d"
	install -Dm644 boards.d/* -t "$pkgdir/usr/share/arm-image-installer/boards.d"
	install -Dm755 update-uboot -t "$pkgdir/usr/bin/"
	install -Dm755 arm-image-installer -t "$pkgdir/usr/bin/"
	install -Dm755 rpi-uboot-update -t "$pkgdir/usr/bin/"
}
