# Maintainer: Andrew Sun <adsun701@gmail.com>
# Contributor: Joel Teichroeb <joel at teichroeb dot net>
# Contributor: Alim Gokkaya <alimgokkaya at gmail dot com>

pkgname=librdkafka
pkgver=1.1.0
pkgrel=1
pkgdesc='Apache Kafka C driver library'
url="https://github.com/edenhill/librdkafka"
license=('BSD')
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/edenhill/librdkafka/archive/v${pkgver}.tar.gz")
arch=('x86_64')
depends=(zlib libsasl zstd)
makedepends=(python openssl lz4 rapidjson)
sha256sums=('123b47404c16bcde194b4bd1221c21fdce832ad12912bd8074f88f64b2b86f2b')

build() {
  cd $srcdir/librdkafka-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd $srcdir/librdkafka-$pkgver
  make install DESTDIR="$pkgdir"
  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
