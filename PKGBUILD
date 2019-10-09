# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Joel Teichroeb <joel at teichroeb dot net>
# Contributor: Alim Gokkaya <alimgokkaya at gmail dot com>

pkgname=librdkafka
pkgver=1.2.1
pkgrel=1
pkgdesc='Apache Kafka C driver library'
arch=('x86_64')
url="https://github.com/edenhill/librdkafka"
license=('BSD')
depends=(libsasl zstd)
makedepends=(python openssl lz4 rapidjson)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/edenhill/librdkafka/archive/v${pkgver}.tar.gz")
sha256sums=('f6be27772babfdacbbf2e4c5432ea46c57ef5b7d82e52a81b885e7b804781fd6')

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
