# Maintainer: L. Bradley LaBoon <me@bradleylaboon.com>
plugin=ingest-user-agent
pkgname=elasticsearch-$plugin
pkgver=6.6.1
pkgrel=2
pkgdesc="Ingest processor that extracts information from a user agent"
url="https://www.elastic.co/guide/en/elasticsearch/plugins/current/${plugin}.html"
arch=('any')
license=('Apache')
depends=("elasticsearch=$pkgver")
source=("https://artifacts.elastic.co/downloads/elasticsearch-plugins/${plugin}/${plugin}-${pkgver}.zip")
sha256sums=('3618a2f3dbbd9d9d1702962f50313ef4589b5bcb054d3eabd0636e8cd423f065')

package() {
	cd "$srcdir"
	rm "$plugin-$pkgver.zip"
	rm LICENSE.txt
	install -dm 0755 "$pkgdir/usr/share/elasticsearch/plugins/$plugin"
	cp -r * "$pkgdir/usr/share/elasticsearch/plugins/$plugin"
}
