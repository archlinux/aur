# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protolint"
pkgname="${_pkgname}-bin"
pkgver=0.54.1
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('aarch64' 'armv6h' 'armv7h' 'x86_64')
url="https://github.com/yoheimuta/${_pkgname}"
license=('MIT')
provides=("${_pkgname}" 'protoc-gen-protolint')
conflicts=("${_pkgname}" 'protoc-gen-protolint')
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${_pkgsrc}-armv6h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${_pkgsrc}-armv7h.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
sha256sums_aarch64=('b4f6dcceb13c96843563233990058e3ce20deeb637faf657f04e0053adf6218b')
sha256sums_armv6h=('b6fe763f31edff2cd0b0b7ca0f69d87ec2206a953537638a189223be61093d82')
sha256sums_armv7h=('e5577e29db329b6abe2181c01c6591c2769ac81341ae371aadb2b5dbdc02e720')
sha256sums_x86_64=('0d6bb58416ff3f5d9cbbcc7c0b43fd4a9fac25208f082fb0a326798aecfe674c')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}"          "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm755 "protoc-gen-protolint" "${pkgdir}/usr/bin/protoc-gen-protolint"
  install -vDm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"   "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
