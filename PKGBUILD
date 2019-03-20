# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
plugin=ingest-user-agent
pkgname=elasticsearch-$plugin
pkgver=6.6.2
pkgrel=1
pkgdesc="Ingest processor that extracts information from a user agent"
url="https://www.elastic.co/guide/en/elasticsearch/plugins/current/${plugin}.html"
arch=('any')
license=('Apache')
depends=("elasticsearch=$pkgver")
source=("https://artifacts.elastic.co/downloads/elasticsearch-plugins/${plugin}/${plugin}-${pkgver}.zip")
sha256sums=('e409d66ad867f59d734a536361ed74e5da2daf8236acd6514bcff2af6a5dff27')

package() {
	cd "$srcdir"
	rm "$plugin-$pkgver.zip"
	rm LICENSE.txt
	install -dm 0755 "$pkgdir/usr/share/elasticsearch/plugins/$plugin"
	cp -r * "$pkgdir/usr/share/elasticsearch/plugins/$plugin"
}
