# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go-grpc"
pkgname="${_pkgname}-bin"
pkgver=1.5.1
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
sha256sums_x86_64=('a6cac4ea731e54aea304ad44d704a69d1cdc82997084b33637e21a89dc9229d6')
sha256sums_i686=('1cf630ffcad2c46b88f24d845fbddf5f238d1bddd93b506f182f1fb572d5f253')
sha256sums_aarch64=('370a7cfa5786e61e6fdc5aa8f689e35c2d27d036a49caac7aa25f962c89a01e8')

package() {
  cd "${srcdir}"
  install -Dm755 "${_pkgname}" "${pkgdir}/usr/bin/${_pkgname}"
  install -Dm644 "README.md"   "${pkgdir}/usr/share/doc/${_pkgname}/README.md"
  install -Dm644 "LICENSE"     "${pkgdir}/usr/share/licenses/${_pkgname}/LICENSE"
}
