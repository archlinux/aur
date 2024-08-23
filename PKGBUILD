# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marius Hirt <marius-hirt@web.de>

_pkgname="zork++"
pkgname="${_pkgname}-bin"
pkgver=0.11.0
pkgrel=1
pkgdesc="A project manager and build system for modern C++"
arch=('x86_64')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/default.${_pkgname}.${_pkgname}.tar.gz")
sha256sums=('61a7ea8a707347104dccfe9063e553b3976c60e187bbb68405705f1c9dd1ad98')
sha256sums_x86_64=('97a0b3ade393b2932ba747a7ca3a86e4987a6af3c1c09e88669019826bf51c84')

package() {
  cd "${srcdir}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
