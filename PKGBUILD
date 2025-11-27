# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go-grpc"
pkgname="${_pkgname}-bin"
pkgver=1.6.0
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
_pkgsrc="${_pkgname}-${pkgver}"
source_aarch64=(
  "${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/cmd%2F${_pkgname}%2Fv${pkgver}/${_pkgname}.v${pkgver}.linux.arm64.tar.gz"
)
source_i686=(
  "${_pkgsrc}-i686.tar.gz::${url}/releases/download/cmd%2F${_pkgname}%2Fv${pkgver}/${_pkgname}.v${pkgver}.linux.386.tar.gz"
)
source_x86_64=(
  "${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/cmd%2F${_pkgname}%2Fv${pkgver}/${_pkgname}.v${pkgver}.linux.amd64.tar.gz"
)
sha256sums_aarch64=('a5168a1a83489e1b138a1116c09f429a3dd18f9ad1a74565d811a2d29d8528c3')
sha256sums_i686=('c1595939163a5dfb04650af3349fea12a33fed26251951eb3968e6cca6dfc456')
sha256sums_x86_64=('acb6144a1a00f688d108bc06a8cbe3b88b4d9f7aad59f7e3e7c91f93b92a1df3')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -vDm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -vDm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
