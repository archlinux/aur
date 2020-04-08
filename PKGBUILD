# Maintainer: Adam Goldsmith <contact@adamgoldsmith.name>

pkgname=qemu-pebble
pkgver=4.5
pkgrel=1
pkgdesc="QEMU emulator for the pebble smartwatch"
url="https://developer.rebble.io/developer.pebble.com/index.html"
arch=('i386' 'x86_64')
license=('MIT')
depends=('dtc' 'libpng12')
source_i386=("https://developer.rebble.io/s3.amazonaws.com/assets.getpebble.com/pebble-tool/pebble-sdk-${pkgver}-linux32.tar.bz2")
source_x86_64=("https://developer.rebble.io/s3.amazonaws.com/assets.getpebble.com/pebble-tool/pebble-sdk-${pkgver}-linux64.tar.bz2")
sha1sums_i386=('f5e9e3ba91811b1a486a14b6b2c8558d13a01982')
sha1sums_x86_64=('7bc45d4dc085e7ffb6a49c3ae1d263461051c7f5')

if [ "$CARCH" == "x86_64" ]
then
  folder="pebble-sdk-${pkgver}-linux64"
else
  folder="pebble-sdk-${pkgver}-linux32"
fi

package() {
  cd "$srcdir/${folder}"
  install -dm755 "$pkgdir/usr/bin"
  install -m755 "bin/qemu-pebble" "$pkgdir/usr/bin"
}

# vim:set ts=2 sw=2 et:
