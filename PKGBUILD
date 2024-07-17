# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go-grpc"
pkgname="${_pkgname}-bin"
pkgver=1.4.0
pkgrel=1
pkgdesc="gRPC bindings generator for Go language"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/grpc/grpc-go"
license=('Apache-2.0')
depends=('protoc-gen-go')
provides=("${_pkgname}")
conflicts=("${_pkgname}")
_pkgsrc="${_pkgname}-${pkgver}"
source_x86_64=("${_pkgsrc}-x86_64.tar.gz::${url}/releases/download/cmd%2F${_pkgname}%2Fv${pkgver}/${_pkgname}.v${pkgver}.linux.amd64.tar.gz")
source_i686=("${_pkgsrc}-i686.tar.gz::${url}/releases/download/cmd%2F${_pkgname}%2Fv${pkgver}/${_pkgname}.v${pkgver}.linux.386.tar.gz")
source_aarch64=("${_pkgsrc}-aarch64.tar.gz::${url}/releases/download/cmd%2F${_pkgname}%2Fv${pkgver}/${_pkgname}.v${pkgver}.linux.arm64.tar.gz")
sha256sums_x86_64=('168d4e0da5e81fbe73de9a06d32acb28dde9ca27a62afe42626478468ad9236c')
sha256sums_i686=('c5381118f3a13dc03137f9bf8dc1e27da3cdd8c41a8416db5af74710da80754f')
sha256sums_aarch64=('04a9874c0da75491940edc0fb78fe3e885d99c60b118ee114908a100f0fd8bd4')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
