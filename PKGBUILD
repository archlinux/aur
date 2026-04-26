# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cdncheck"
pkgname="${_pkgname}-bin"
pkgver=1.2.33
pkgrel=1
pkgdesc="A utility to detect various technology for a given IP address"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/projectdiscovery/${_pkgname}"
license=(
  'MIT'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.zip"
)
source_armv7h=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm.zip"
)
source_i686=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_386.zip"
)
source_x86_64=(
  "${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.zip"
)
sha256sums_aarch64=('14010aadee5b5b090edfc08e05a4320e1fb1666fe0c3be349b8db3efe163c06a')
sha256sums_armv7h=('f42a8312571f11797350a724378dabdf1fffc375cb03468cee805f6bc19eead7')
sha256sums_i686=('d569a0ca39e87f1db0112d6be2e9db99ffbd85ea224494484c314cb0f6896f0f')
sha256sums_x86_64=('9edb93e77852df8de0a8ea72a327e39d8194111afdc7165b96c17d50a4356fec')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
