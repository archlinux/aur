# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="anyzig"
pkgname="${_pkgname}-bin"
pkgver=2026_10_23
pkgrel=1
pkgdesc="One zig to rule them all"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://github.com/marler8997/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
  "${_pkgsrc}-LICENSE::${url}/raw/refs/tags/v${pkgver}/LICENSE"
)
source_aarch64=(
  "${_pkgsrc}-aarch64-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux.tar.gz"
)
source_armv7h=(
  "${_pkgsrc}-arm-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-arm-linux.tar.gz"
)
source_i686=(
  "${_pkgsrc}-x86-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86-linux.tar.gz"
)
source_powerpc64le=(
  "${_pkgsrc}-powerpc64le-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-powerpc64le-linux.tar.gz"
)
source_riscv64=(
  "${_pkgsrc}-riscv64-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-riscv64-linux.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64-linux.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux.tar.gz"
)
sha256sums=('4cf0cb1eff9e991243f36225ece249760a47b7387e6e518afc873e6fdb01c364'
            '491fef2e3fe35219d5bd74c3b0d166d323e279678fca49bb48200348d04c769d')
sha256sums_aarch64=('196e43be6ef5a7d748b98b2d5c6fb976d1c24ff76da5cfbd1a898ed6755e0504')
sha256sums_armv7h=('546a5cb9c63cbccdf42b4ba0f1f023963d7405e4283c1047266e58bc37b0b670')
sha256sums_i686=('72900004242bf8cf354dcd499ad75a17f2ba8382f0a41fc8bbe51c6725f7486a')
sha256sums_powerpc64le=('a6f8852cb7452af84856a637cdcc630a0d8da5ec1d5b6f8d261c25639ba029c5')
sha256sums_riscv64=('8b7c12972161899c73706a24825f0162586a6e6f3c00aeb6d5f9756bde63f7fc')
sha256sums_x86_64=('9475f2aba65240f7a3d402d8b8d98ea4e96eb2540a40308490a9e7b5215222f1')

package() {
  cd "${srcdir}"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
