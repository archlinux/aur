# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protolint"
pkgname="${_pkgname}-bin"
pkgver=0.50.3
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/yoheimuta/${_pkgname}"
license=('MIT')
provides=("${_pkgname}" 'protoc-gen-protolint')
conflicts=("${_pkgname}" 'protoc-gen-protolint')
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('23842478ce2d74c623f22776a1549df89304b9a6a9ab39053fc8f0b962f6d746')
sha256sums_aarch64=('560eae777e312438c7bd3b3a4ebe83ae639d8e6ec26fecf8e69b293d30141079')
sha256sums_armv6h=('de45ec70b3bff8b090a7677878ba3b2a78fb30d03dd01944133e8662490b8f98')
sha256sums_armv7h=('4e8c429f2f061278929536eefa55d1365988ee1b48341fe018a7b1d443d408f1')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "protoc-gen-protolint" "${pkgdir}/usr/bin/protoc-gen-protolint"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
