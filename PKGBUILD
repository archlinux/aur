# Maintainer: kXuan <kxuanobj at gmail dot com>

pkgname=protoc-gen-grpc-web
pkgver=1.0.4
pkgrel=1
pkgdesc='Protobuf gRPC compiler for Web Clients'
arch=('x86_64')
url='https://github.com/grpc/grpc-web'
license=('Apache2')
depends=('protobuf>=3')
source=("https://github.com/grpc/grpc-web/archive/${pkgver}.tar.gz")
sha512sums=('858bbd861ee1771b4db1d8d6f01cdc0fb4748c8112b9f5e04691f054d24562df97c2e66546cab7230bd98caae46276e2bdc77292de676baedc8c5320ac59a8e1')

build() {
    cd "grpc-web-${pkgver}"
    make plugin
}

package() {
    cd "grpc-web-${pkgver}"
	install -Dm755 javascript/net/grpc/web/protoc-gen-grpc-web ${pkgdir}/usr/bin/protoc-gen-grpc-web
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

