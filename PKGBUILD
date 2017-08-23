# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=percona-nagios-plugins
pkgver=1.1.7
pkgrel=1
pkgdesc="Enterprise-grade MySQL monitoring plugins for nagios"
arch=("any")
url="http://www.percona.com/software/percona-monitoring-plugins/"
license=('GPL')

source=("https://www.percona.com/downloads/percona-monitoring-plugins/percona-monitoring-plugins-$pkgver/binary/tarball/percona-monitoring-plugins-$pkgver.tar.gz")
sha256sums=('a4e497ef01b298cb3199cd8d43817c39bc741bf0205e413d3040d36cb97fa0e1')

package() {
	cd "$srcdir/percona-monitoring-plugins-$pkgver/nagios/bin"

	for plugin in *; do
		install -Dm0755 "$plugin" "$pkgdir/usr/lib/monitoring-plugins/$plugin"
	done
}
