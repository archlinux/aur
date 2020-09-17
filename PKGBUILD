# Maintainer: Glen D'souza <gdsouza@linuxmail.org>
# Maintainer: aimileus <me at aimileus dot nl>
pkgname=fedora-arm-installer
_pkgname=arm-image-installer
pkgver=2.18
pkgrel=1
pkgdesc="Script to automate the installation of Fedora on ARM boards"
arch=('any')
url="https://pagure.io/arm-image-installer"
license=('GPL')
depends=('bash' 'e2fsprogs' 'parted' 'util-linux')
makedepends=('git')
source=("https://pagure.io/$_pkgname/archive/$_pkgname-$pkgver/$_pkgname-$_pkgname-$pkgver.tar.gz")
sha512sums=('7105ea24a24a1bed39b0d5ddfd489b9e35fb5eb89ab3cbd901ad1d0e6e95efef06e6dad3e3069dcf00c346d48a1e0ad7468c3b9e65ea135b0f150fe4afa38a9f')

package() {
	cd "$_pkgname-$_pkgname-$pkgver"
	install -Dm644 socs.d/* -t "$pkgdir/usr/share/arm-image-installer/socs.d"
	install -Dm644 boards.d/* -t "$pkgdir/usr/share/arm-image-installer/boards.d"
	install -Dm755 update-uboot -t "$pkgdir/usr/bin/"
	install -Dm755 arm-image-installer -t "$pkgdir/usr/bin/"
	install -Dm755 rpi-uboot-update -t "$pkgdir/usr/bin/"
}
