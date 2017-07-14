# Maintainer: Tyler Veness <calcmogul at gmail dot com>

_target_arch=arm
_target=${_target_arch}-frc-linux-gnueabi
pkgname=${_target}-linux-api-headers
pkgver=4.4
_basever=4.4-r0.22
_year=2017
pkgrel=1
pkgdesc="Kernel headers sanitized for use in userspace (${_target})"
arch=(any)
url="http://www.gnu.org/software/libc"
license=('GPL2')
groups=('frc-toolchain')
source=("http://download.ni.com/ni-linux-rt/feeds/${_year}/arm/ipk/cortexa9-vfpv3/linux-libc-headers-dev_${_basever}_cortexa9-vfpv3.ipk")
sha512sums=('a4d835afce21bbaff5e04720191e2059eedf05a9bfd833e6a1002866ad6db5bdb451de73e8952fbd63e67f5bc6bd3bd3409e457d7e2a0620e84fdf3ff0cde9fd')

package() {
  cd "${srcdir}"

  ar x linux-libc-headers-dev_${_basever}_cortexa9-vfpv3.ipk
  tar xf data.tar.gz
  
  cd usr
  mkdir -p ${pkgdir}/usr/${_target}/usr
  find . \( -name .install -o -name ..install.cmd \) -delete
  cp -r ./* ${pkgdir}/usr/${_target}/usr
}
