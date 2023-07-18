# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

pkgname=rocm-llvm-alt-bin
_pkgname=rocm-llvm-alt
pkgver=5.6.0
_pkgver=5.6
pkgrel=1
_debfile="${_pkgname}_16.0.0.23045.50600-67~20.04_amd64.deb"
pkgdesc='Closed source components for rocm-llvm'
arch=('x86_64')
url='https://rocm.docs.amd.com/en/latest/reference/rocmcc/rocmcc.html'
license=('EULA')
provides=('rocm-llvm-alt')
conflicts=('rocm-llvm-alt')
source=("$pkgname-$pkgver.tar.gz::http://repo.radeon.com/rocm/apt/${_pkgver}/pool/proprietary/r/rocm-llvm-alt/${_debfile}")
sha256sums=('84e3b1ccc11aad174178f1e70a82649be5ad27d3aaf361496009ae7838aae9ec')

package() {
  tar -C "$pkgdir" -xf data.tar.gz
  rename -- "-$pkgver" '' "$pkgdir/opt/rocm-$pkgver"
  find "$pkgdir" -type d -exec chmod 755 '{}' '+'
}
