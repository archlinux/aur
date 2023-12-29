# Maintainer: Torsten Keßler <tpkessler at archlinux dot org>

pkgname=rocm-llvm-alt-bin
_pkgname=rocm-llvm-alt
pkgver=6.0.0
_pkgver=6.0
pkgrel=1
_debfile="${_pkgname}_17.0.0.23311.60000-91~20.04_amd64.deb"
pkgdesc='Closed source components for rocm-llvm'
arch=('x86_64')
url='https://rocm.docs.amd.com/en/latest/reference/rocmcc/rocmcc.html'
license=('EULA')
provides=('rocm-llvm-alt')
conflicts=('rocm-llvm-alt')
source=("$pkgname-$pkgver.tar.gz::http://repo.radeon.com/rocm/apt/${_pkgver}/pool/proprietary/r/rocm-llvm-alt/${_debfile}")
sha256sums=('70884eab23c3d2c329186fd7dde0dc5b6bf59b9ff4af3324d355b08787c41f27')

package() {
  tar -C "$pkgdir" -xf data.tar.gz
  rename -- "-$pkgver" '' "$pkgdir/opt/rocm-$pkgver"
  find "$pkgdir" -type d -exec chmod 755 '{}' '+'
}
