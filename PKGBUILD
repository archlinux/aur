# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="asm-processor"
pkgname="${_pkgname}-bin"
pkgver=1.0.1
pkgrel=1
pkgdesc="Pre-process .c files and post-process .o files to enable embedding MIPS assembly into IDO-compiled C"
arch=(
  'aarch64'
  'x86_64'
)
url="https://github.com/simonlindholm/${_pkgname}"
license=(
  'Unlicense'
)
depends=(
  'gcc-libs'
  'glibc'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${url##*/}-${pkgver}"
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.xz::${url}/releases/download/${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.xz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.xz::${url}/releases/download/${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.xz"
)
sha256sums_aarch64=('8d2fcf12dafaae642de38e424032f3be78222a086993b8384612466aa0d0c5c8')
sha256sums_x86_64=('9385a83c5f85a76777755d054c19f95c5dd8db4477822c7c6b41cd5dedf9e8e7')

package() {
  cd "${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
