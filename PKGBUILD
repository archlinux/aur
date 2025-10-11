# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="DemBones"
_pkgname="${_Name,,}"
pkgname="${_pkgname}-bin"
pkgver=1.2.1
pkgrel=1
pkgdesc="An automated algorithm to extract the linear blend skinning (LBS) from a set of example poses "
arch=('x86_64')
url="https://github.com/electronicarts/dem-bones"
license=('BSD-3-Clause')
depends=(
  'gcc-libs'
  'glibc'
  'libxml2-legacy'
  'zlib'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
_pkgsrc="${_pkgname}-${pkgver}"
source=("${_pkgsrc}-README.md::${url}/raw/refs/tags/v${pkgver}/README.md"
        "${_pkgsrc}-LICENSE.md::${url}/raw/refs/tags/v${pkgver}/LICENSE.md")
source_x86_64=("${_pkgsrc}-x86_64::${url}/raw/refs/tags/v${pkgver}/bin/Linux/${_Name}")
sha256sums=('7758db85285ac15664fabeb0756c906b12790b161d2c7dd34db21a871c01abb3'
            '8a65a1d8189b678b7da090ca257fa9aef0d6f4a00a2710005e0ac40c9634d9d8')
sha256sums_x86_64=('27797f67f404ed8d454e547aa79b0a736198742d9897b3e802b0c46424767572')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgsrc}-${CARCH}"   "${pkgdir}/usr/bin/${_Name}"
  install -vDm644 "${_pkgsrc}-README.md"  "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "${_pkgsrc}-LICENSE.md" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
