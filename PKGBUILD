# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>
# Contributor: FLX (Paul Werther) <flx@evait.de>

_pkgname="pdtm"
pkgname="${_pkgname}-bin"
pkgver=0.1.5
pkgrel=1
pkgdesc="ProjectDiscovery's Open Source Tool Manager"
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
depends=(
  'glibc'
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
sha256sums_aarch64=('47d46a383c8ee68aee754fbfc82d074331105864f94431281aac5a418e6de1dd')
sha256sums_armv7h=('65e3f3b05a05c289969ae9e8d47ffdca58f061dc0f976fc0610bc04f18dd2d05')
sha256sums_i686=('0cc5deee145fdf51db359b7ec3793695ae8302c52fc0544fe2e8692158a408cf')
sha256sums_x86_64=('3daa3fddc0cb1b6938d12d917c60150faee2b69b62ac27aa598d8c9267a537c7')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE.md"  -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
