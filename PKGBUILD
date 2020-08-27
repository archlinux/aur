# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='postgres-decoderbufs'
pkgver=1.2.2
pkgrel=1
pkgdesc='A PostgreSQL logical decoder output plugin to deliver data as Protocol Buffers, adapted for Debezium'
arch=('i686' 'x86_64')
url="https://github.com/debezium/${pkgname}"
license=('MIT')
depends=('protobuf-c')
makedepends=('gcc' 'postgresql')
source=("${url}/archive/v${pkgver}.Final.tar.gz")
sha256sums=('3df97ec717cd6bd9f0ef25eb4307f8e79b61ebf3dedb762f4fce86e88148fab4')

build(){
  cd "${srcdir}/${pkgname}-${pkgver}.Final"
  make
}

package(){
  cd "${srcdir}/${pkgname}-${pkgver}.Final"
  make DESTDIR="${pkgdir}" install
}
