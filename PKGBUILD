# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=percona-nagios-plugins
pkgver=1.1.6
pkgrel=1
pkgdesc="Enterprise-grade MySQL monitoring plugins for nagios"
arch=("any")
url="http://www.percona.com/software/percona-monitoring-plugins/"
license=('GPL')

source=("https://www.percona.com/downloads/percona-monitoring-plugins/$pkgver/percona-monitoring-plugins-$pkgver.tar.gz")

package() {
	cd "$srcdir/percona-monitoring-plugins-$pkgver/nagios/bin"

	for plugin in *; do
		install -Dm0755 "$plugin" "$pkgdir/usr/lib/monitoring-plugins/$plugin"
	done
}

sha256sums=('01149ed15831130b6ed2fd72ebeb3f735fc936fd6a193cfb49b09f649a89f89e')
