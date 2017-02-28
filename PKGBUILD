# Maintainer: Severus <severus@theslinux.org>

pkgname=jmeter
pkgver=3.1
pkgrel=1
arch=('any')
pkgdesc="A Java desktop application designed to load test functional behavior and measure performance"
url="http://jmeter.apache.org/"
license=("apache")
depends=("java-environment>=6")
options=('!strip')

source=("http://www.us.apache.org/dist//jmeter/binaries/apache-${pkgname}-${pkgver}.tgz"{,.asc})
sha256sums=('SKIP'
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
