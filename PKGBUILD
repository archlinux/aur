# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=percona-nagios-plugins
pkgver=1.1.8
pkgrel=1
pkgdesc="Enterprise-grade MySQL monitoring plugins for nagios"
arch=("any")
url="http://www.percona.com/software/percona-monitoring-plugins/"
license=('GPL')

source=("https://www.percona.com/downloads/percona-monitoring-plugins/percona-monitoring-plugins-$pkgver/binary/tarball/percona-monitoring-plugins-$pkgver.tar.gz")
sha256sums=('c7a7ce92788bcc7df9e58d922365562f151854f1b4b5215e279fc7c4484b91dc')

package() {
	cd "$srcdir/percona-monitoring-plugins-$pkgver/nagios/bin"

	for plugin in *; do
		install -Dm0755 "$plugin" "$pkgdir/usr/lib/monitoring-plugins/$plugin"
	done
}
