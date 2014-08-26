# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=percona-nagios-plugins
pkgver=1.1.4
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

sha256sums=('ce6b6f19ac6d6c0cbeead5bd3a54adcc91dc51bc14e81c4f0e5109cc5ee8a495')
