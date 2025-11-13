# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="dt"
pkgname="${_pkgname}-bin"
pkgver=1.3.1
pkgrel=1
pkgdesc="It's duct tape for your UNIX pipes. A programming language for doing small stuff fast, easy, and readable."
arch=(
  'aarch64'
  'i686' 
  'powerpc'
  'powerpc64le'
  'riscv64'
  'x86_64'
)
url="https://dt.plumbing"
_url="https://github.com/so-dang-cool/${_pkgname}"
license=(
  'BSD-3-Clause'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=(
  "${_pkgsrc}-LICENSE.md::${_url}/raw/refs/tags/v${pkgver}/LICENSE.md"
  "${_pkgsrc}-README.md::${_url}/raw/refs/tags/v${pkgver}/README.md"
)
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-aarch64-linux-gnu.tgz"
)
source_i686=(
  "${_pkgsrc}-i686.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-x86-linux-gnu.tgz"
)
source_powerpc=(
  "${_pkgsrc}-powerpc.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-powerpc-linux-gnu.tgz"
)
source_powerpc64le=(
  "${_pkgsrc}-powerpc64le.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-powerpc64le-linux-gnu.tgz"
)
source_riscv64=(
  "${_pkgsrc}-riscv64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-riscv64-linux-gnu.tgz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.gz::${_url}/releases/download/v${pkgver}/${_pkgname}-x86_64-linux-gnu.tgz"
)
sha256sums=('9d26709114c2fafd6b28dc45d824b535296c920d87ed360c1d64eafcbec44476'
            '225b7a31609ff10c8cfe7d37d5f5eaa4fec0333229f0d3bd26b6ee0b2b7dc674')
sha256sums_aarch64=('b6c33ee2b778ea6eb718f4de96b534d86649202ff90cde9a766ff579cc5750c6')
sha256sums_i686=('d1ad398d052046fadf4396449d20144e0739597b34ec8b58ec987ccb8fa5d6f6')
sha256sums_powerpc=('ec7de0b001cbf34f82117616939ddeb13026aee934b763a2dedde91abb0c827f')
sha256sums_powerpc64le=('5a78da9980fbc881a826c86914b747fa1a57b341c31222ecf1d4d43d085d330b')
sha256sums_riscv64=('2d705bd6d9d1aeb3bfe7e419eac7cf60cec253f9e98a728ac3f1d4f99bbc2571')
sha256sums_x86_64=('5266971d91f4c8457a7da5f9d88e280bf3e0a406a8ef91e7cf50ef2caef45962')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
}
