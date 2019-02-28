# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
plugin=ingest-geoip
pkgname=elasticsearch-$plugin
pkgver=6.6.1
pkgrel=1
pkgdesc="Ingest processor that uses looksup geo data based on ip adresses using the Maxmind geo database"
url="https://www.elastic.co/guide/en/elasticsearch/plugins/current/${plugin}.html"
arch=('any')
license=('Apache')
depends=("elasticsearch=$pkgver")
source=("https://artifacts.elastic.co/downloads/elasticsearch-plugins/${plugin}/${plugin}-${pkgver}.zip")
sha256sums=('5952c21385c275be454e0f6b2d2f4c5c6495590a0776f5d785bba625b44be202')

package() {
	cd "$srcdir"
	rm "$plugin-$pkgver.zip"
	rm LICENSE.txt
	install -dm 0755 "$pkgdir/usr/share/elasticsearch/plugins/$plugin"
	cp -r * "$pkgdir/usr/share/elasticsearch/plugins/$plugin"
}
