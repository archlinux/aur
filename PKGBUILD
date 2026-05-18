# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cdncheck"
pkgname="${_pkgname}-bin"
pkgver=1.2.36
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
sha256sums_aarch64=('53b4270f22e817e60385f609acafe956787ed5a76139a707b9c49a88edc19a7a')
sha256sums_armv7h=('d51d02e898fd3e8d69ad07f50ed2c4110108f54f783f67b5d235a927db56bfe6')
sha256sums_i686=('5abcd90fffb936fb0a6b80dcafa2e3add5e94b4514bcc88c395cd1701e7a3eae')
sha256sums_x86_64=('2cca4055ba8ba81844ac73e4c89b227de045330965eb67d9cb01c37fe66c931c')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
