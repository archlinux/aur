# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: Marius Hirt <marius-hirt@web.de>

_pkgname="zork++"
pkgname="${_pkgname}-bin"
pkgver=0.10.1
pkgrel=2
pkgdesc="A modern C++ project manager and build system for modern C++"
arch=('x86_64')
url='https://github.com/zerodaycode/Zork'
license=('MIT')
depends=('glibc' 'gcc-libs')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source=("README-${pkgver}.md::${url}/raw/v${pkgver}/README.md")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/default.${_pkgname}.${_pkgname}.tar.gz")
sha256sums=('cebd730a91f92604221beab1c142c8c237ad2d4669507e5b39d79491c359a022')
sha256sums_x86_64=('16b41b1ab6aa4c7050549f57b65312afd13b71ced40ef194a67f33960cf4f393')

package() {
  cd "${srcdir}"
  install -Dm755 "target/release/${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README-${pkgver}.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
