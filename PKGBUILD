# Maintainer: Maurice Zhou <ja at apvc punkt uk>

pkgname=bieaz
pkgver=0.0.21
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
md5sums=('3bf7dc0a016951d63243b61c9c8f0873'
         '730393243c14719c345954f90306ef8c')
md5sums=('3b5fd7035c608d4528916c747a688bfc'
         'bac8697ba0fdb65adca3b76668fa01a1')
