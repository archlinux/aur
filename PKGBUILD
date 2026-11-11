# Maintainer: Frikilinux <frikilinux@gmail.com>

pkgname=atomdrift-scan-bin
_binary_name=atomscan
pkgver=2.13.0
pkgrel=1
pkgdesc="0-day malware detection for binaries, source & scripts (that doesn't suck)"
arch=('x86_64')
url="https://github.com/atomdrift-project/scan"
license=(Apache-2.0)
depends=(
  glibc
  libgcc
  libstdc++
)
optdepends=(
  "7zip: 7-Zip / CAB / tar archive extraction"
  "upx: UPX-packed executable detection"
  "innoextract: Inno Setup installer extraction"
  "rizin: binary disassembly and import/export analysis"
)
conflicts=(atomdrift-scan)
source=("${url}/releases/download/v${pkgver}/${_binary_name}-${pkgver}-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('adfa8d9cec948a08164c6e30793e9d3f001873f4a86b28b7b250de1dc3be0026')

package() {
  install -Dm755 ${_binary_name} "${pkgdir}/usr/bin/${_binary_name}"
}