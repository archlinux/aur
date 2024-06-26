# Maintainer: vitaliikuzhdin <vitaliikuzhdin@gmail.com>

_pkgname=protolint
pkgname=${_pkgname}-bin
pkgver=0.50.1
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
sha256sums_x86_64=('38912611557cf13055ff3b3f8b486661b7b5647657237fa04c5884232f2cdd94')
sha256sums_aarch64=('a3c4108c169c630a0e985761948dfc4109048225ab52b42697cb80891d89c4d8')
sha256sums_armv6h=('bc8c10932f23ef95ea5e0871927c993c973e51b86aecd5722ff3829205399cf9')
sha256sums_armv7h=('b0224962c630e398134a30b4780f8df43f0bf1f36f48bda8e47bc67824a0b26a')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm755 "protoc-gen-protolint" "${pkgdir}/usr/bin/protoc-gen-protolint"
  install -Dm644 "README.md" "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE" "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
