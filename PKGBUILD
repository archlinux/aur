# Maintainer: kXuan <kxuanobj at gmail dot com>

pkgname=protoc-gen-grpc-web
pkgver=1.3.0
pkgrel=0
pkgdesc='Protobuf gRPC compiler for Web Clients'
arch=('x86_64')
url='https://github.com/grpc/grpc-web'
license=('Apache2')
depends=('protobuf>=3')
source=("https://github.com/grpc/grpc-web/archive/${pkgver}.tar.gz")
sha512sums=('8023d32550df88d3cdd510211bcb58afc8c002e131f0d30720a7e8783e388709ebcf84277be255e3292578d8d93d0f6c5d6d3e062ac2eb2ae0d0a31eb201df8e')

build() {
    cd "grpc-web-${pkgver}"
    make plugin
}

package() {
    cd "grpc-web-${pkgver}"
	install -Dm755 javascript/net/grpc/web/generator/protoc-gen-grpc-web ${pkgdir}/usr/bin/protoc-gen-grpc-web
    install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

