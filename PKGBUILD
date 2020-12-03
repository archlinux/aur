# Maintainer: Konstantin Shalygin <k0ste@k0ste.ru>
# Contributor: Konstantin Shalygin <k0ste@k0ste.ru>

pkgname='postgres-decoderbufs'
pkgver=1.3.1
pkgrel=1
pkgdesc='A PostgreSQL logical decoder output plugin to deliver data as Protocol Buffers, adapted for Debezium'
arch=('i686' 'x86_64')
url="https://github.com/debezium/${pkgname}"
license=('MIT')
depends=('protobuf-c')
makedepends=('gcc' 'postgresql')
source=("${url}/archive/v.${pkgver}.Final.tar.gz")
sha256sums=('9b5001fbeee5dccd97ea6841a1ca1a13fb7ae21d39392019dae1e232e364a262')

build(){
  cd "${srcdir}/${pkgname}-v.${pkgver}.Final"
  make
}

package(){
  cd "${srcdir}/${pkgname}-v.${pkgver}.Final"
  make DESTDIR="${pkgdir}" install
}
