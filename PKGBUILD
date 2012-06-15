# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=percona-nagios-plugins
pkgver=1.0.1
pkgrel=1
pkgdesc="Enterprise-grade MySQL monitoring plugins for nagios"
arch=("any")
url="http://www.percona.com/software/percona-monitoring-plugins/"
license=('GPL')

source=("http://www.percona.com/downloads/percona-monitoring-plugins/percona-monitoring-plugins-$pkgver.tar.gz")

package() {
	cd "$srcdir/percona-monitoring-plugins-$pkgver/nagios/bin"
	rm *~

	for plugin in *; do
		install -Dm0755 "$plugin" "$pkgdir/usr/share/nagios/libexec/$plugin"
	done
}

md5sums=('03513138a2e0490d24cd348d85e92333')
sha256sums=('22f1992586e4e136101becedf3b0a1ebf1f46fc450ca805962282d46c6dde215')
