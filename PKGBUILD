# Maintainer: Lorenzo Fontana <lo@linux.com>
pkgname=protobuf-bin
pkgver=3.6.1
pkgrel=1
pkgdesc="Protocol Buffers - Google's data interchange format (binary version)"
arch=('x86_64')
conflicts=('protobuf')
url="https://github.com/google/protobuf"
license=('custom')
provides=('protobuf')
makedepends=('unzip')
source=(protobuf_x86_64.zip::https://github.com/google/protobuf/releases/download/v${pkgver}/protoc-${pkgver}-linux-x86_64.zip
LICENSE::https://github.com/google/protobuf/raw/v${pkgver}/LICENSE)

sha256sums=('6003de742ea3fcf703cfec1cd4a3380fd143081a2eb0e559065563496af27807'
'6e5e117324afd944dcf67f36cf329843bc1a92229a8cd9bb573d7a83130fea7d')

package() {
    install -Dm755 "$srcdir/bin/protoc" "$pkgdir/usr/bin/protoc"
    install -dm644 "$srcdir/include/google/protobuf" "$pkgdir/usr/include/google/protobuf"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
