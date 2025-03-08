# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="countryfetch"
pkgname="${_pkgname}-bin"
pkgver=0.1.9
pkgrel=1
pkgdesc="A neofetch-like tool for fetching information about your country"
arch=('x86_64')
url="https://github.com/nik-rev/${_pkgname}"
license=('MIT')
depends=('gcc-libs' 'glibc')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.xz::${url}/releases/download/v${pkgver}/${_pkgname}-x86_64-unknown-linux-gnu.tar.xz")
sha256sums_x86_64=('0ee0108c51baadcb2f6dd187a49405918f9037764114b45f30484942c11a611c')

package() {
  cd "${srcdir}/${_pkgname}-${CARCH}-unknown-linux-gnu"
  install -vDm755 "${_pkgname}"  "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "CHANGELOG.md" "${pkgdir}/usr/share/doc/${_pkgname}/CHANGELOG.md"
  install -vDm644 "README.md"    "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"      "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
