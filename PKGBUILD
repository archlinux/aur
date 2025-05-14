# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="asm-processor"
pkgname="${_pkgname}-bin"
pkgver=1.0.0
pkgrel=1
pkgdesc="Pre-process .c files and post-process .o files to enable embedding MIPS assembly into IDO-compiled C"
arch=('aarch64' 'x86_64')
url="https://github.com/simonlindholm/${_pkgname}"
license=('Unlicense')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${url##*/}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.xz::${url}/releases/download/${pkgver}/${_pkgname}-aarch64-unknown-linux-gnu.tar.xz")
source_x86_64=("${_pkgsrc}-x86_64.tar.xz::${url}/releases/download/${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_aarch64=('7b716ca540bb9f00cf9a7d848d95d13a49ce5222f0d2bc91a8e849df48e1f67d')
sha256sums_x86_64=('24091182b0af4f14926a29a1775fa35c51f730b7a530bbd991c5549429b0cb7e')

package() {
  cd "${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
