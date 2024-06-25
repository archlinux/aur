# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=protolint
pkgname=${_pkgname}-bin
pkgver=0.49.8
pkgrel=1
pkgdesc="A pluggable linter and fixer to enforce Protocol Buffer style and conventions"
arch=('x86_64' 'aarch64' 'armv6h' 'armv7h')
url="https://github.com/yoheimuta/${_pkgname}"
license=('MIT')
conflicts=("${_pkgname}")
provides=("${_pkgname}")
source_x86_64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_amd64.tar.gz")
source_aarch64=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_arm64.tar.gz")
source_armv6h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv6.tar.gz")
source_armv7h=("${url}/releases/download/v${pkgver}/${_pkgname}_${pkgver}_linux_armv7.tar.gz")
sha256sums_x86_64=('035f3fd1d6c50f223604ec4f99b5f9bbd9d4d9dae77a050a521fa651b287822e')
sha256sums_aarch64=('b1dcc7673669b0351809bf644a1a4b3f7f0918d96e0b401bf18956b6e30a9bca')
sha256sums_armv6h=('b6670f37257f12b5cb08204e31c6ad2c4e6bc8881746049f6e9a012c94148f42')
sha256sums_armv7h=('45d1b9de0d696bfa7c88ce3826748a526f1a02e857fd1b130478f0b1c5b2631b')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "protoc-gen-protolint" "${pkgdir}/usr/bin/protoc-gen-protolint"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
