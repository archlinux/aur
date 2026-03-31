# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go-grpc"
pkgname="${_pkgname}-bin"
pkgver=1.6.1
pkgrel=1
pkgdesc="gRPC bindings generator for Go language"
arch=(
  'aarch64'
  'i686'
  'x86_64'
)
url="https://github.com/grpc/grpc-go"
license=(
  'Apache-2.0'
)
depends=(
  'protoc-gen-go'
)
provides=(
  "${_pkgname}"
)
conflicts=(
  "${_pkgname}"
)
source_aarch64=(
  "${url}/releases/download/cmd%2F${_pkgname}%2Fv${pkgver}/${_pkgname}.v${pkgver}.linux.arm64.tar.gz"
)
source_i686=(
  "${url}/releases/download/cmd%2F${_pkgname}%2Fv${pkgver}/${_pkgname}.v${pkgver}.linux.386.tar.gz"
)
source_x86_64=(
  "${url}/releases/download/cmd%2F${_pkgname}%2Fv${pkgver}/${_pkgname}.v${pkgver}.linux.amd64.tar.gz"
)
sha256sums_aarch64=('71f64c5448fe57425002e77a3b85a317dc1ffb276c094ca19f9be3cf3dba066d')
sha256sums_i686=('2cc5415d9d574a4b24b87ffaba8fda37307c538675f3f98f1c309369eceaeba4')
sha256sums_x86_64=('d422c203a0f4f050d647c58a11b8854535956b6c9aa655dd8a50b976a2b552f9')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
