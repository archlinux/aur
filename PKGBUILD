# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protolint"
pkgname="${_pkgname}-bin"
pkgver=0.52.0
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
sha256sums_x86_64=('9f2fb6fe1f1c07665fb6df3c6686049b762752699c312dc4877de09a9d7630ce')
sha256sums_aarch64=('3324e44a91485dd9c707c3926b79fa4829662d5dadb8aabe9109c626abb78679')
sha256sums_armv6h=('85272ebc00525107a2824fcfbf5d00a4447d0912723713c765d92b5ebdfef692')
sha256sums_armv7h=('bb2935271ef72d647fdc7a6b2276b0a476961cbdbb86ec173f8919fb980e794c')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "protoc-gen-protolint" "${pkgdir}/usr/bin/protoc-gen-protolint"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
