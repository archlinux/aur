# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marius Hirt <marius-hirt@web.de>

_pkgname="zork++"
pkgname="${_pkgname}-bin"
pkgver=0.10.3
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
sha256sums=('a705d01df63a842b2edce3bb47c86eeb1783b3381ca9214ac073fc5145531327')
sha256sums_x86_64=('a394aa8d599bb1fccee0475d3d94ee7f66cd3cf1b7c1180be25cb92f25b32fe0')

package() {
  cd "${srcdir}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
