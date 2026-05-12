# Maintainer:  Vitalii Kuzhdin <vitaliikuzhdin@gmail.com>

_pkgname="protoc-gen-go-grpc"
pkgname="${_pkgname}-bin"
pkgver=1.6.2
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
sha256sums_aarch64=('343307d42a93c0219692302296e5fa38b89a9563732511b18a93479be4b0f43d')
sha256sums_i686=('0274a1a334c752a6014c88e8bbea4ac34794b843cf32d820d1fe9efa48ee5fdd')
sha256sums_x86_64=('3d36f376624c73eb62c7a46e34c2b21a1e97684fb1812e882ba775ba05b7bfc9')

package() {
  cd "${srcdir}"
  install -vDm755 "${_pkgname}" -t "${pkgdir}/usr/bin"
  install -vDm644 "README.md"   -t "${pkgdir}/usr/share/doc/${_pkgname}"
  install -vDm644 "LICENSE"     -t "${pkgdir}/usr/share/licenses/${_pkgname}"
}
