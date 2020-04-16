# Maintainer: Andy Fang <andy+aur at andyfang dot me>

pkgname=kafkacat
pkgver=1.5.0
pkgrel=1
pkgdesc='Generic command line non-JVM Apache Kafka producer and consumer'
url="https://github.com/edenhill/kafkacat"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/edenhill/kafkacat/archive/${pkgver}.tar.gz")
arch=(x86_64)
depends=(glibc zlib librdkafka yajl avro-c)
makedepends=()
sha256sums=('16f358fab258cbefc328cf642f72ee8b5dae1648657d508997279ca5bd0fbef0')

build() {
  cd kafkacat-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd kafkacat-${pkgver}
  make install DESTDIR="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
