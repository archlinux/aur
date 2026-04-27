# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="hack-browser-data"
pkgname="${_pkgname}-bin"
pkgver=0.4.6
pkgrel=1
pkgdesc="Extract and decrypt browser data, supporting multiple data types"
arch=(
  'aarch64'
  'armv7h'
  'i686'
  'x86_64'
)
url="https://github.com/moonD4rk/HackBrowserData"
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
  "${_pkgname}-${pkgver}-linux-arm64.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm64.zip"
)
source_armv7h=(
  "${_pkgname}-${pkgver}-linux-arm.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-arm.zip"
)
source_i686=(
  "${_pkgname}-${pkgver}-linux-32bit.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-32bit.zip"
)
source_x86_64=(
  "${_pkgname}-${pkgver}-linux-64bit.zip::${url}/releases/download/v${pkgver}/${_pkgname}-linux-64bit.zip"
)
sha256sums_aarch64=('2d9767f216401dc44c68896979f69b9efbfbbeb328a85e0817f13894e60fdc2f')
sha256sums_armv7h=('c1ce90005c4ce253689cf60d6068d1d4088723626bd27c969bf728332b6ea2b8')
sha256sums_i686=('e409b72a7e7e5b5a95b3a611201df2d64f20e5d955144034a2725081213fe3a0')
sha256sums_x86_64=('cc9b4192f804c6d7d4d0cbf71c7312027e6a6188e1df8f32d7bb2bd1176d39fd')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"    "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"      "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  # install -vDm644 "README_ZH.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"        "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
