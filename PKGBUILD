# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=percona-nagios-plugins
pkgver=1.0.2
pkgrel=1
pkgdesc="Enterprise-grade MySQL monitoring plugins for nagios"
arch=("any")
url="http://www.percona.com/software/percona-monitoring-plugins/"
license=('GPL')

source=("http://www.percona.com/downloads/percona-monitoring-plugins/$pkgver/percona-monitoring-plugins-$pkgver.tar.gz")

package() {
	cd "$srcdir/percona-monitoring-plugins-$pkgver/nagios/bin"

	for plugin in *; do
		install -Dm0755 "$plugin" "$pkgdir/usr/share/nagios/libexec/$plugin"
	done
}

sha256sums=('da84cfe89637292da15ddb1e66f67ad9703fa21392d8d49e664ad08f7aa45585')
