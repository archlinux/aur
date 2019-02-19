# Maintainer: Joel Teichroeb <joel at teichroeb dot net>
# Contributero: Alim Gokkaya <alimgokkaya at gmail dot com>

pkgname=librdkafka
pkgver=0.11.6
pkgrel=1
pkgdesc='Apache Kafka C driver library'
url="https://github.com/edenhill/librdkafka"
license=('BSD')
source=("https://github.com/edenhill/librdkafka/archive/v$pkgver.tar.gz")
arch=(x86_64)
depends=(glibc zlib)
optdepends=(openssl libsasl lz4)
makedepends=(python)
sha256sums=('9c0afb8b53779d968225edf1e79da48a162895ad557900f75e7978f65e642032')

build() {
  cd librdkafka-$pkgver
  ./configure --prefix=/usr
  make
}

package() {
  cd librdkafka-$pkgver
  make install DESTDIR="$pkgdir"
  install -D -m644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
