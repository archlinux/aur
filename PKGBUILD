# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go-grpc"
pkgname="${_pkgname}-bin"
pkgver=1.5.0
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
sha256sums_x86_64=('f50970cdbb972f2820e4cf2075aa48b69e87a5560f21c4d02770f6f4629aa03b')
sha256sums_i686=('76b21b77417022e5139cc92bf0b4f85526cf6b6fbf918c42fe103dc3dc455606')
sha256sums_aarch64=('0820810222e417eb1d3884e5e31860b20563e43e32a0ef2b54f1ab25c8758dcd')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
