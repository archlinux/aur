# Maintainer: Glen D'souza <gdsouza@linuxmail.org>
# Maintainer: aimileus <me at aimileus dot nl>
pkgname=fedora-arm-installer
_pkgname=arm-image-installer
pkgver=2.17
pkgrel=1
pkgdesc="Script to automate the installation of Fedora on ARM boards"
arch=('any')
url="https://pagure.io/arm-image-installer"
license=('GPL')
depends=('bash' 'e2fsprogs' 'parted' 'util-linux')
makedepends=('git')
source=("https://pagure.io/$_pkgname/archive/$_pkgname-$pkgver/$_pkgname-$_pkgname-$pkgver.tar.gz")
sha512sums=('76e6515a9e7918b156bd8ed0063805ac25964b1759f4a1190268d77cb81e12e17e5ae6a463989da483634b81fb3c1346a33e6d56f4e4aa76a3161c75f6d7a633')

package() {
	cd "$_pkgname-$_pkgname-$pkgver"
	install -Dm644 socs.d/* -t "$pkgdir/usr/share/arm-image-installer/socs.d"
	install -Dm644 boards.d/* -t "$pkgdir/usr/share/arm-image-installer/boards.d"
	install -Dm755 update-uboot -t "$pkgdir/usr/bin/"
	install -Dm755 arm-image-installer -t "$pkgdir/usr/bin/"
	install -Dm755 rpi-uboot-update -t "$pkgdir/usr/bin/"
}
