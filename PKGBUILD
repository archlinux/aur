# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protolint"
pkgname="${_pkgname}-bin"
pkgver=0.50.5
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/yoheimuta/${_pkgname}"
license=('MIT')
provides=("${_pkgname}" 'protoc-gen-protolint')
conflicts=("${_pkgname}" 'protoc-gen-protolint')
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('f6073ee43c8f87d4a9a8479f5f806f3d3d06741534ae0facbe135a632c4e5988')
sha256sums_aarch64=('d154ac182079d81d3b375c43c18682de8bf52c4bdc46607bd88309016f001361')
sha256sums_armv6h=('c3f5fa9a062189c182e624138b0e369d154893d57388b10975f0b89bec6f3649')
sha256sums_armv7h=('074e6bd9788bc9aa35d03e05a7172dcdb38750d4d2bcd013494f3d9e9e2687db')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "protoc-gen-protolint" "${pkgdir}/usr/bin/protoc-gen-protolint"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
