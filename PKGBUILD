# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=jmeter
pkgver=2.13
pkgrel=1
arch=('any')
pkgdesc="A Java desktop application designed to load test functional behavior and measure performance"
url="http://jakarta.apache.org/jmeter/"
license=("apache")
depends=("java-environment>=6")
options=('!strip')

source=("http://www.us.apache.org/dist//jmeter/binaries/apache-${pkgname}-${pkgver}.tgz"{,.asc})
sha256sums=('9fe33d3d6e381103d3ced2962cdef5c164a06fc58c55e247eadf5a5dbcd4d8fe'
            'SKIP')
validpgpkeys=('C4923F9ABFB2F1A06F08E88BAC214CAA0612B399')
build() {
  true
}

package() {
  install -dm755 "$pkgdir/opt/jmeter" "$pkgdir/usr/bin"

  cp -a "apache-$pkgname-$pkgver"/* "$pkgdir/opt/jmeter"
  ln -s /opt/jmeter/bin/jmeter "$pkgdir/usr/bin/jmeter"
  sed -i '/^java/s|`dirname "$0"`|/opt/jmeter/bin|' "$pkgdir/opt/jmeter/bin/jmeter"
}

# vim:set ts=2 sw=2 et:
