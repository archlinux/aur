# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="cdncheck"
pkgname="${_pkgname}-bin"
pkgver=1.2.40
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
sha256sums_aarch64=('475ae7944d37d85535005fb172174c67d747c9adb65cdccdd5ce20c509e57a51')
sha256sums_armv7h=('71017a33d5d76b99b4a52572f2fa9712e1d4017971f3877fade2ad26dfe04936')
sha256sums_i686=('1e66d92f65f3ec9f192dbb58b73b738436ce15fa51059e403338cb4cc87cdea6')
sha256sums_x86_64=('ea7f82096c552dd21ba813312ed78aca318283c7741a869387b51092eb883fc2')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE.md"  "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE.md"
}
