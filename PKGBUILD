# Maintainer: picokan <todaysoracle@protonmail.com>

pkgname=influxdb-runit
pkgver=20250507
pkgrel=1
pkgdesc="Runit service script for influxdb."
arch=("x86_64")
url="https://github.com/InfluxData/influxdb"
license=("MIT")
depends=( "runit" "influxdb")
source=("influxdb.run" "influxdb.log.run" "influxdb.conf")
sha256sums=('ba597c754bf7dcace7665a78c1f76a18ab51bdb956131c9b9d66ca15ac5ba4fe'
            '297437d7613174679998ddf26eaa369dc13369733476271b136ee38d3705f05e'
            '56d11bdfb118d3e2958c4979bfd7bfe181abbe9c5c10043f326e04d33c4794fc')

package() {
	cd "$srcdir"
	install -Dm755 influxdb.run "$pkgdir/etc/runit/sv/influxdb/run"
	install -Dm755 influxdb.log.run "$pkgdir/etc/runit/sv/influxdb/log/run"
	install -Dm755 influxdb.conf "$pkgdir/etc/runit/sv/influxdb/conf"
}
