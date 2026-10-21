# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="anyzig"
pkgname="${_pkgname}-bin"
pkgver=2026_10_20
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
sha256sums=('19ba39bfca2a645e3a142a5dd1ad56e8d730d2143aead8152bf9c42ed12abfd0'
            '491fef2e3fe35219d5bd74c3b0d166d323e279678fca49bb48200348d04c769d')
sha256sums_aarch64=('276b497b06e553a9b1215ce9a65eec3c385229784f1193bb910961a61ea75f14')
sha256sums_armv7h=('b741e11a178792d06ea374f825d76de9abb78caf9a69623616c347e936df2a33')
sha256sums_i686=('fb404acc97a68b5031b4f613f5d71c8e4d623adf9b833fca143cd84140c64343')
sha256sums_powerpc64le=('544d62b1897e42ff5edbc1e376b960c7d55bf1fc0518d1932879f9f41f0a15b3')
sha256sums_riscv64=('60130f88a3f40d8d60ca6a0a7d6d2b8fb49b7fe725610a2e909ea02430edf7c5')
sha256sums_x86_64=('2e1f73d4fa73b11fcd64096900f231b2dae22a1baea9933aa1d6f60cb5ea1252')

package() {
  cd "${srcdir}"
  install -vDm755 "zig" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
