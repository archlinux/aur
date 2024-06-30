# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marius Hirt <marius-hirt@web.de>

_pkgname="zork++"
pkgname="${_pkgname}-bin"
pkgver=0.9.0
pkgrel=1
pkgdesc="A modern C++ project manager and build system for modern C++"
arch=('x86_64')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
source=("${url}/raw/v${pkgver}/README.md")
source_x86_64=("${url}/releases/download/v${pkgver}/default.${_pkgname}.${_pkgname}.tar.gz")
sha256sums=('53db6f103d87763f545bc519a687098c522121a93db33642e6360587d0851d15')
sha256sums_x86_64=('d62df381a6476697186a6de7948162c1d8d253d805751375494bdd5f57f508dc')

package() {
  cd "${srcdir}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
