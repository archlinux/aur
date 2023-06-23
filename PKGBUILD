# Maintainer: Christer Solskogen <christer.solskogen@gmail.com>

_arch=aarch64
_kernel_arch=arm64
_target=$_arch-unknown-linux-gnu
pkgname=$_arch-linux-api-headers
pkgver=6.1.35
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace for $_kernel_arch"
arch=(any)
options=(!strip)
url='https://www.kernel.org'
license=(GPL2)
makedepends=(rsync)
source=(https://www.kernel.org/pub/linux/kernel/v6.x/linux-$pkgver.tar.{xz,sign})
sha256sums=('be368143bc5d0dc73dd3e8c6191630c1620520379baf6f47c16116b2c0bc26ac'
	'SKIP')

validpgpkeys=(
  'ABAF11C65A2970B130ABE3C479BE3E4300411886'  # Linus Torvalds
  '647F28654894E3BD457199BE38DBBDC86092693E'  # Greg Kroah-Hartman
)


package() {
  cd linux-$pkgver

  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/sys-root/usr" ARCH=$_kernel_arch headers_install

}
