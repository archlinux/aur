# Maintainer: Felix Singer

pkgname=murmur-snapshot-noice
pkgver=1.3.0_2318_g8f65051
pkgrel=1
pkgdesc="The voice chat application server for Mumble"
arch=('i686' 'x86_64')
url="https://mumble.info"
license=('BSD')
depends=('qt5-base' 'protobuf')
makedepends=('python' 'boost')
source=("https://mumble.info/snapshot/mumble-${pkgver//_/\~}~snapshot.tar.gz")
sha512sums=('ac8b08e8bf1265913d44b298bedb36bd6dab40e00b87fad8a594f742b2e4e596b0edceb9b91517cab33703386516764473e082935273f0c7e859eaa9d629233e')

build() {
  cd $srcdir/mumble-${pkgver//_/\~}~snapshot

  qmake-qt5 main.pro \
    CONFIG+="no-client no-bonjour no-ice" \
    INCLUDEPATH+="/usr/include/openssl-1.0" \
    QMAKE_LFLAGS+="-L/usr/lib/openssl-1.0 -lssl -lcrypto"

  make release
}

package() {
  echo test
}

# vim: sw=2:ts=2 et:
