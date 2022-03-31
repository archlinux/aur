# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocm-llvm-alt-bin
_pkgname=rocm-llvm-alt
pkgver=5.1.0
_pkgver=5.1
pkgrel=1
_debfile="${_pkgname}_13.0.0.22045.50100-36_amd64.deb"
pkgdesc='Closed source components for rocm-llvm'
arch=('x86_64')
url='https://docs.amd.com/category/ROCm_v5.1'
license=('EULA')
depends=()
provides=('rocm-llvm-alt')
conflicts=('rocm-llvm-alt')
source=("$pkgname-$pkgver.tar.gz::http://repo.radeon.com/rocm/apt/${_pkgver}/pool/proprietary/r/rocm-llvm-alt/${_debfile}")
sha256sums=('b33c2f3adec317f283e1dceff567927407f94ef3afc4093d91d1533641442143')

package() {
  tar -C "$pkgdir" -xf data.tar.xz
  rename -- "-$pkgver" '' "$pkgdir/opt/rocm-$pkgver"
  find "$pkgdir" -type d -exec chmod 755 '{}' '+'
}
