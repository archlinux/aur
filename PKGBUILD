# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver=0.0.33
pkgrel=1
pkgdesc="Shell script ZFS boot environment manager"
arch=(any)
url="https://gitlab.com/m_zhou/bieaz"
license=('GPL')
depends=('coreutils')
optdepends=('grub: select boot environment at boot')
source=(
	"$url/-/archive/$pkgver/$pkgname-$pkgver.tar.gz"
	"0000-42_bieaz-detect-archlinux-initramfs.patch"
)
package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
prepare() {
	cd "${srcdir}/$pkgname-$pkgver/"
	echo "Patch to detect of Arch Linux initramfs images by grub-mkconfig..."
	patch -Np1 -i "${srcdir}/0000-42_bieaz-detect-archlinux-initramfs.patch"
}
md5sums=('c17320337108484ba5297208bc90e4f2'
         '1e6b0557de8f46c8a0db45895821abe5')
