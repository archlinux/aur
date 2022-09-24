# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocm-llvm-alt-bin
_pkgname=rocm-llvm-alt
pkgver=5.2.3
_pkgver=5.2.3
pkgrel=1
_debfile="${_pkgname}${_pkgver}_14.0.0.22252.50203-109_amd64.deb"
pkgdesc='Closed source components for rocm-llvm'
arch=('x86_64')
url='https://docs.amd.com/category/ROCm_v5.2'
license=('EULA')
depends=()
provides=('rocm-llvm-alt')
conflicts=('rocm-llvm-alt')
source=("$pkgname-$pkgver.tar.gz::http://repo.radeon.com/rocm/apt/${_pkgver}/pool/proprietary/r/rocm-llvm-alt${_pkgver}/${_debfile}")
sha256sums=('e1fa1e932ce7aa0a56912cf71ac58a705bb996f854523bda0df65e91ec39be28')

package() {
  tar -C "$pkgdir" -xf data.tar.xz
  rename -- "-$pkgver" '' "$pkgdir/opt/rocm-$pkgver"
  find "$pkgdir" -type d -exec chmod 755 '{}' '+'
}
