# Maintainer: Andrew Sun <adsun701 at gmail dot com>
# Contributor: Joel Teichroeb <joel at teichroeb dot net>
# Contributor: Alim Gokkaya <alimgokkaya at gmail dot com>

pkgname=librdkafka
pkgver=1.2.2
pkgrel=1
pkgdesc='The Apache Kafka C/C++ library'
arch=('x86_64')
url="https://github.com/edenhill/librdkafka"
license=('BSD')
depends=(libsasl zstd)
makedepends=(python openssl lz4 rapidjson)
source=("${pkgname}-${pkgver}.tar.gz"::"https://github.com/edenhill/librdkafka/archive/v${pkgver}.tar.gz")
sha256sums=('c5d6eb6ce080431f2996ee7e8e1f4b8f6c61455a1011b922e325e28e88d01b53')

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
