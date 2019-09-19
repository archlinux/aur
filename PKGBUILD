# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Joel Teichroeb <joel at teichroeb dot net>
# Contributor: Alim Gokkaya <alimgokkaya at gmail dot com>

pkgname=librdkafka
pkgver=1.2.0
pkgrel=1
pkgdesc='Apache Kafka C driver library'
arch=('x86_64')
url="https://github.com/edenhill/librdkafka"
license=('BSD')
depends=(libsasl zstd)
makedepends=(python openssl lz4 rapidjson)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/edenhill/librdkafka/archive/v${pkgver}.tar.gz")
sha256sums=('eedde1c96104e4ac2d22a4230e34f35dd60d53976ae2563e3dd7c27190a96859')

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
