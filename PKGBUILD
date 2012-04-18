# Maintainer: Massimiliano Torromeo <massimiliano.torromeo@gmail.com>

pkgname=percona-nagios-plugins
pkgver=1.0.0
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

md5sums=('b492d4856223dc0aac0494cb4dbaaf1f')
sha256sums=('7092351293bb06ec5228af6e0b9d278988a10a26d53c480d8289b6d7312389db')
