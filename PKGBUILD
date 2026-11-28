# Maintainer: Amir Husayn Panahifar <ahp@panahifar.ir>

pkgname=raven-riscv-bin
pkgver=1.30.0
pkgrel=1
pkgdesc="RISC-V simulator and IDE for learning assembly"
arch=('x86_64')
url="https://github.com/Gaok1/Raven-RiscV"
license=('Apache-2.0')
depends=('glibc' 'libgcc' 'wayland')
provides=("${pkgname%-bin}")
conflicts=("${pkgname%-bin}")
options=('!debug')
_dl="${url}/releases/download/v${pkgver}"
source=("${pkgname}-${pkgver}-LICENSE::https://raw.githubusercontent.com/Gaok1/Raven-RiscV/v${pkgver}/LICENSE-APACHE.txt")
source_x86_64=("${pkgname}-${pkgver}-x86_64.tar.gz::${_dl}/raven-x86_64-unknown-linux-gnu.tar.gz")
sha256sums=('62c7a1e35f56406896d7aa7ca52d0cc0d272ac022b5d2796e7d6905db8a3636a')
sha256sums_x86_64=('e82d8a4d021daef2ba38e7f4cca081489669313a458a156ae359f0634e323b0b')

package() {
  install -Dm755 "raven" "${pkgdir}/usr/bin/raven"
  install -Dm644 "${srcdir}/${pkgname}-${pkgver}-LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
