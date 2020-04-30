# Maintainer: Nathan Loewen <loewen.nathan@gmail.com>
pkgname='fscrawler-bin'
pkgver='2.7.20200402.145915.95'
pkgrel='1'
pkgdesc='Elasticsearch File System Crawler'
arch=('any')
url='https://github.com/dadoonet/fscrawler'
license=('Apache')
depends=('elasticsearch>=7')
source=('https://oss.sonatype.org/content/repositories/snapshots/fr/pilato/elasticsearch/crawler/fscrawler-es7/2.7-SNAPSHOT/fscrawler-es7-2.7-20200402.145915-95.zip')
sha1sums=('7e69d463277a2aac584cdc0089b2fc1a1cfb6bbc')

prepare() {
	# Remove Windows batch script
	rm fscrawler-es7-2.7-SNAPSHOT/bin/fscrawler.bat
}

package() {
	mkdir -p "$pkgdir/opt/fscrawler"
	cp -r "$srcdir/fscrawler-es7-2.7-SNAPSHOT/"* "$pkgdir/opt/fscrawler"
	mkdir -p "$pkgdir/usr/bin"
	ln -sf '/opt/fscrawler/bin/fscrawler' "$pkgdir/usr/bin/fscrawler"
}