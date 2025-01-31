# Maintainer: Mohamed Amine Zghal (medaminezghal) <medaminezghal at outlook dot com>

pkgname="protoc-gen-twirp"
pkgver=8.1.3
pkgrel=2
pkgdesc="Twirp and Protobuf Generators"
arch=('aarch64' 'i686' 'x86_64')
url="https://github.com/twitchtv/twirp/tree/main/protoc-gen-twirp"
license=('Apache-2.0')
depends=('protobuf')
makedepends=('go')

package() {
  mkdir -p ${srcdir}/"build"
  GOBIN=${srcdir}/"build" go install github.com/twitchtv/twirp/${pkgname}@v${pkgver}
  install -vDm755 "build/${pkgname}" "${pkgdir}/usr/bin/${pkgname}"
}
