# Maintainer: David Roheim <david dot roheim at gmail dot com>
# Contributor: Dave Reisner <d@falconindy.com>

pkgname=jmeter
pkgver=3.0
pkgrel=1
arch=('any')
pkgdesc="A Java desktop application designed to load test functional behavior and measure performance"
url="http://jakarta.apache.org/jmeter/"
license=("apache")
depends=("java-environment>=6")
options=('!strip')

source=("http://www.us.apache.org/dist//jmeter/binaries/apache-${pkgname}-${pkgver}.tgz"{,.asc})
sha256sums=('f5350a02c2abb0fd2273c9913d851719100be83a7e67a46efbe951f7764fdf03'
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
