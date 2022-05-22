# Maintainer: Torsten Keßler <t dot kessler at posteo dot de>

pkgname=rocm-llvm-alt-bin
_pkgname=rocm-llvm-alt
pkgver=5.1.3
_pkgver=5.1.3
pkgrel=1
_debfile="${_pkgname}_13.0.0.22045.50103-66_amd64.deb"
pkgdesc='Closed source components for rocm-llvm'
arch=('x86_64')
url='https://docs.amd.com/category/ROCm_v5.1'
license=('EULA')
depends=()
provides=('rocm-llvm-alt')
conflicts=('rocm-llvm-alt')
source=("$pkgname-$pkgver.tar.gz::http://repo.radeon.com/rocm/apt/${_pkgver}/pool/proprietary/r/rocm-llvm-alt/${_debfile}")
sha256sums=('53c95665c3685c57ed5acca92539d3e1f1dfe60db2bf9f32bca9658242280352')

package() {
  tar -C "$pkgdir" -xf data.tar.xz
  rename -- "-$pkgver" '' "$pkgdir/opt/rocm-$pkgver"
  find "$pkgdir" -type d -exec chmod 755 '{}' '+'
}
