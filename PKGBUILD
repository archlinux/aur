# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocm-llvm-alt-bin
_pkgname=rocm-llvm-alt
pkgver=5.2.1
_pkgver=5.2.1
pkgrel=1
_debfile="${_pkgname}_14.0.0.22252.50201-79_amd64.deb"
pkgdesc='Closed source components for rocm-llvm'
arch=('x86_64')
url='https://docs.amd.com/category/ROCm_v5.2'
license=('EULA')
depends=()
provides=('rocm-llvm-alt')
conflicts=('rocm-llvm-alt')
source=("$pkgname-$pkgver.tar.gz::http://repo.radeon.com/rocm/apt/${_pkgver}/pool/proprietary/r/rocm-llvm-alt/${_debfile}")
sha256sums=('55c5a3fdfb1ffafb5f9cb16b280785f2959b9c296ae138c08a3e2ec30715a4a0')

package() {
  tar -C "$pkgdir" -xf data.tar.xz
  rename -- "-$pkgver" '' "$pkgdir/opt/rocm-$pkgver"
  find "$pkgdir" -type d -exec chmod 755 '{}' '+'
}
