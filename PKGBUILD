# Contributor: Nathan Loewen <loewen.nathan@gmail.com>
pkgname='fscrawler-bin'
pkgver='2.9_20211220.205213_11'
_fsversion='2.9-SNAPSHOT'
_esversion='es7'
pkgrel='1'
pkgdesc='Elasticsearch File System Crawler'
arch=('any')
url='https://github.com/dadoonet/fscrawler'
license=('Apache')
source=("https://oss.sonatype.org/content/repositories/snapshots/fr/pilato/elasticsearch/crawler/fscrawler-$_esversion/$_fsversion/fscrawler-$_esversion-${pkgver//_/-}.zip")
sha256sums=('4f8ebb1fdaad1a1868c731a21ed04fc07e9ba0af01210848a33c54366fc595a7')

prepare() {
	# Remove Windows batch script
	rm fscrawler-$_esversion-$_fsversion/bin/fscrawler.bat
}

package() {
	mkdir -p "$pkgdir/opt/fscrawler"
	cp -r "$srcdir/fscrawler-$_esversion-$_fsversion/"* "$pkgdir/opt/fscrawler"
	mkdir -p "$pkgdir/usr/bin"
	ln -sf '/opt/fscrawler/bin/fscrawler' "$pkgdir/usr/bin/fscrawler"
}
