# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='postgres-decoderbufs'
pkgver=1.7.0
pkgrel=1
pkgdesc='A PostgreSQL logical decoder output plugin to deliver data as Protocol Buffers, adapted for Debezium'
arch=('i686' 'x86_64')
url="https://github.com/debezium/${pkgname}"
license=('MIT')
depends=('protobuf-c')
makedepends=('clang' 'llvm' 'postgresql')
source=("${url}/archive/v${pkgver}.Final.tar.gz")
sha256sums=('a8b19c620e953b86d110783923d8fa2e223722537610846eebdc8df204c18023')

build(){
  cd "${srcdir}/${pkgname}-${pkgver}.Final"
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}.Final"
  make DESTDIR="${pkgdir}" install
}
