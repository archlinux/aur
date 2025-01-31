# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname="protoc-gen-psrpc"
pkgver=0.6.0
pkgrel=1
pkgdesc="PubSub-RPC and Protobuf Generators"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/livekit/psrpc/tree/main/protoc-gen-psrpc"
license=('Apache-2.0')
depends=('protobuf')
makedepends=('go')

package() {
  mkdir -p ${srcdir}/"build"
  GOBIN=${srcdir}/"build" go install github.com/livekit/psrpc/${pkgname}@v${pkgver}
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
