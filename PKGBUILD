# Maintainer: Nicolas Farmer <nicolas dot farmer at proton dot me>

_target_arch=ia64
_target=ia64-linux-gnu
pkgname=$_target-linux-api-headers
pkgver=6.9_epic2
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace (IA64) (from linux-ia64 project)"
arch=(any)
url='https://github.com/linux-ia64/linux-ia64'
license=(GPL2)
source=(git+https://github.com/linux-ia64/linux-ia64.git)
sha256sums=('SKIP')

package() {
  cd linux-ia64

  make INSTALL_HDR_PATH="$pkgdir/usr/$_target/" ARCH=$_target_arch V=0 headers_install

  # clean-up unnecessary files generated during install
  find "$pkgdir" \( -name .install -or -name ..install.cmd \) -delete
}
