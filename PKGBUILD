# Maintainer: Moritz Luedecke <ritze@skweez.net>

pkgname=grafana-plugins-git
_pkgname=grafana-plugins
pkgver=20150518
pkgrel=1
pkgdesc="Extensions, custom & experimental panels"
arch=('any')
url="http://grafana.org"
license=('APACHE')
depends=('grafana')
source=('git://github.com/grafana/grafana-plugins')
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
	install -dm755 "$pkgdir/usr/share/grafana/public/app/plugins/datasource"
	mv "$srcdir/$_pkgname/datasources" "$srcdir/$_pkgname/datasource"
	cp -r "$srcdir/$_pkgname/datasource" "$pkgdir/usr/share/grafana/public/app/plugins"
}
