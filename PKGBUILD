# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocm-llvm-alt-bin
_pkgname=rocm-llvm-alt
pkgver=5.3.0
_pkgver=5.3
pkgrel=1
_debfile="${_pkgname}_15.0.0.22376.50300-63~20.04_amd64.deb"
pkgdesc='Closed source components for rocm-llvm'
arch=('x86_64')
url='https://docs.amd.com/category/ROCm_v5.3'
license=('EULA')
provides=('rocm-llvm-alt')
conflicts=('rocm-llvm-alt')
source=("$pkgname-$pkgver.tar.gz::http://repo.radeon.com/rocm/apt/${_pkgver}/pool/proprietary/r/rocm-llvm-alt/${_debfile}")
sha256sums=('741558072e643972fdb484c5e125ea1eae3370a04a56ad9937c41b0fe034741a')

package() {
  tar -C "$pkgdir" -xf data.tar.xz
  rename -- "-$pkgver" '' "$pkgdir/opt/rocm-$pkgver"
  find "$pkgdir" -type d -exec chmod 755 '{}' '+'
}
