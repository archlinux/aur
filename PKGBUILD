# Maintainer: Logan Sevcik <logan+aur@sevcik.email>
pkgname=arm-image-installer
pkgver=3.7
pkgrel=1
pkgdesc="Install and manipulate ARM disk images"
arch=(any)
url="https://pagure.io/arm-image-installer"
license=(GPL2)
depends=('btrfs-progs' 'e2fsprogs' 'libselinux' 'parted' 'sudo' 'util-linux' 'xfsprogs' 'xz')
source=(https://pagure.io/arm-image-installer/archive/arm-image-installer-$pkgver/arm-image-installer-arm-image-installer-$pkgver.tar.gz)
md5sums=('3a9990874dc9ec8fcf14a9a582e47b26')

package() {
	mkdir -p "$pkgdir/usr/"{bin,share/arm-image-installer,share/doc/arm-image-installer}
	find "$srcdir/arm-image-installer-arm-image-installer-$pkgver" -mindepth 1 -maxdepth 1 -type f -perm -u=x -exec \
		install -Dm755 {} "$pkgdir/usr/bin" \;
	find "$srcdir/arm-image-installer-arm-image-installer-$pkgver" -mindepth 1 -maxdepth 1 -type d -exec \
		cp -r {} "$pkgdir/usr/share/arm-image-installer" \;
	cp "$srcdir/arm-image-installer-arm-image-installer-$pkgver/SUPPORTED-BOARDS" "$pkgdir/usr/share/doc/arm-image-installer"
}
