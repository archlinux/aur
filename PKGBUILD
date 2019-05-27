# Maintainer: Julian Brost <julian@0x4a42.net>

pkgname=icingaweb2-module-grafana
pkgver=1.3.5
pkgrel=1
pkgdesc='Grafana module for Icinga Web 2 (supports InfluxDB & Graphite)'
license=('GPL')
arch=('any')
depends=('icingaweb2')
optdepends=('grafana: rendering of graphs')
url='https://github.com/Mikesch-mp/icingaweb2-module-grafana'
source=("$pkgname-$pkgver.tar.gz::https://github.com/Mikesch-mp/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c24ef277efe5a3acd14a77c59f620eff96af4fe408991fb82d7af6c3bef166ee')

package() {
	cd "$srcdir/$pkgname-$pkgver"

	mkdir -p "$pkgdir/etc/icingaweb2/modules/grafana"

	mkdir -p "$pkgdir/usr/share/webapps/icingaweb2/modules/grafana"
	cp -r application configuration.php library module.info public run.php \
		"$pkgdir/usr/share/webapps/icingaweb2/modules/grafana"

	mkdir -p "$pkgdir/usr/share/doc"
	cp -r doc "$pkgdir/usr/share/doc/$pkgname"
	cp -r dashboards "$pkgdir/usr/share/doc/$pkgname"
}
