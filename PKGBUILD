# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="anyzig"
pkgname="${_pkgname}-bin"
pkgver=2025_08_03
pkgrel=1
pkgdesc="One zig to rule them all"
arch=('aarch64' 'armv7h' 'i686' 'powerpc64le' 'riscv64' 'x86_64')
url="https://github.com/marler8997/${_pkgname}"
license=('custom:None')
provides=("${_pkgname}") # 'zig' 'zig-nightly'
conflicts=("${_pkgname}") # 'zig'
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md")
        # "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-arm-linux.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86-linux.tar.gz")
source_powerpc64le=("${_pkgsrc}-powerpc64le.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-powerpc64le-linux.tar.gz")
source_riscv64=("${_pkgsrc}-riscv64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-riscv64-linux.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz")
sha256sums=('f3be3ed086f47766a0c361876984a89e4f4c82496dfda6cb82ab8734619563fb')
sha256sums_aarch64=('7fded6dd84d130b11edd71bf86681565c01149ef5815fed714859098a058e2ce')
sha256sums_armv7h=('0f57441910546b9550ab1322e46ef3c6d75c621c96527addeaa7af4484e41a1a')
sha256sums_i686=('5608fc5e5f58299e283d11c19d922a9d02f63838af459aef7c23ba8b51e5d00a')
sha256sums_powerpc64le=('04bdf1b64f892e6e99d8a126f83fd9931a92345d149fae60dbb16b3dc9aa2646')
sha256sums_riscv64=('9d1ba50bc9563e3f4ccef10b5443208e79e1b143ac9a3546f92ce9fa6495e2b3')
sha256sums_x86_64=('f7075b19e7c1df12844bb4f4fb78c187a8da2aacd44cd6eaa75364c94b9f0083')

package() {
  cd "${srcdir}"
  # install -vDm755 "zig" "${pkgdir}/usr/bin/zig"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
