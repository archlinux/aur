# Maintainer: kXuan <kxuanobj at gmail dot com>

pkgname=protoc-gen-grpc-web
pkgver=1.4.2
pkgrel=0
pkgdesc='Protobuf gRPC compiler for Web Clients'
arch=('x86_64')
url='https://github.com/grpc/grpc-web'
license=('Apache2')
depends=('protobuf>=3')
source=("https://github.com/grpc/grpc-web/archive/${pkgver}.tar.gz")
sha512sums=('7b2ddc7ae9e60ded0f137a16a7bb2ec97a8473e4c946339f8a2cd69a594cbf1f1b9767a0e3e5ae1ed789809b50a944251098a15468bf858be22e5360624f5b0f')

build() {
    cd "grpc-web-${pkgver}"
    make STATIC=no plugin
}

package() {
    cd "grpc-web-${pkgver}"
	install -Dm755 javascript/net/grpc/web/generator/protoc-gen-grpc-web ${pkgdir}/usr/bin/protoc-gen-grpc-web
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

