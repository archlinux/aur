# Maintainer: kXuan <kxuanobj at gmail dot com>

pkgname=protoc-gen-grpc-web
pkgver=1.0.0
pkgrel=1
pkgdesc='Protobuf gRPC compiler for Web Clients'
arch=('x86_64')
url='https://github.com/grpc/grpc-web'
license=('Apache2')
depends=('protobuf>=3')
source=("https://github.com/grpc/grpc-web/archive/${pkgver}.tar.gz")
sha512sums=('affce591d5c6dfb4858ad7d6bcc8c7cfadea1d39a4f2878394e962b2bf39abe5c1f5bb1fa244a8675f1a2c717773187692e9a86ebd33196e2889fbd76e5a317f')

build() {
    cd "grpc-web-${pkgver}"
    make plugin
}

package() {
    cd "grpc-web-${pkgver}"
	install -Dm755 javascript/net/grpc/web/protoc-gen-grpc-web ${pkgdir}/usr/bin/protoc-gen-grpc-web
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

