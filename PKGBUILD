# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_Name="Premake"
_basename="${_Name,,}"
pkgver=2.4
_pkgname="${_basename}${pkgver%%.*}"
pkgname="${_pkgname}-bin"
pkgrel=1
pkgdesc="A simple build configuration and project generation tool"
arch=('i686' 'x86_64')
url="https://premake.github.io"
license=('BSD-3-Clause')
depends_i686=('gcc-libs' 'glibc' 'libstdc++5')
depends_x86_64=("${depends_i686[@]/#/lib32-}")
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_basename}-${pkgver}"
source=("${_pkgsrc}.zip::https://downloads.sourceforge.net/project/${_basename}/${_Name}/${pkgver}/${_basename}-src-${pkgver}.zip")
source_i686=("${_pkgsrc}-i686.tar.gz::https://downloads.sourceforge.net/project/${_basename}/${_Name}/${pkgver}/${_basename}-linux-${pkgver}.tar.gz")
source_x86_64=("${source_i686[@]}")
sha256sums=('d17637ec403cf8af8f31f0a31ca2d09e3f2c6f44ed8812ac769b8cd260e9e4fd')
sha256sums_i686=('b97f283b1252998696e428c658a486e7425596a6f40b8af1e7431826c802c884')
sha256sums_x86_64=('b97f283b1252998696e428c658a486e7425596a6f40b8af1e7431826c802c884')

package() {
  cd "${srcdir}"
  install -vDm755 "${_basename}" "${pkgdir}/usr/bin/${_pkgname}"

  cd "${_Name}-${pkgver}"
  install -vDm644 "CHANGES.txt"  "${pkgdir}/usr/share/doc/${_pkgname}/CHANGES.txt"
  install -vDm644 "README.txt"   "${pkgdir}/usr/share/doc/${_pkgname}/README.txt"
  install -vDm644 "LICENSE.txt"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.txt"
}
