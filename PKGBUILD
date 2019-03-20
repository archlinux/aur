# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
plugin=ingest-geoip
pkgname=elasticsearch-$plugin
pkgver=6.6.2
pkgrel=1
pkgdesc="Ingest processor that uses looksup geo data based on ip adresses using the Maxmind geo database"
url="https://www.elastic.co/guide/en/elasticsearch/plugins/current/${plugin}.html"
arch=('any')
license=('Apache')
depends=("elasticsearch=$pkgver")
source=("https://artifacts.elastic.co/downloads/elasticsearch-plugins/${plugin}/${plugin}-${pkgver}.zip")
sha256sums=('15b8795c501f8722387272d5f48644ef7898e27f5cee9a1e6070848e61c45944')

package() {
	cd "$srcdir"
	rm "$plugin-$pkgver.zip"
	rm LICENSE.txt
	install -dm 0755 "$pkgdir/usr/share/elasticsearch/plugins/$plugin"
	install -dm 0755 "$pkgdir/etc/elasticsearch/$plugin"
	cp -r config/* "$pkgdir/etc/elasticsearch/$plugin"
	rm -rf config
	cp -r * "$pkgdir/usr/share/elasticsearch/plugins/$plugin"
}
