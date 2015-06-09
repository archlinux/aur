# Maintainer: Jerome Leclanche <jerome@leclan.ch>
# NOTE: This package is officially named "spark", however that name
# conflicts with the Spark IM client. It is here renamed sparklines.

_pkgname=spark
pkgname=sparklines-git
pkgver=v1.0.1.6.g9832447
pkgrel=1
pkgdesc="Spark: Sparklines for your shell"
arch=('any')
url="http://zachholman.com/spark/"
license=('MIT')
makedepends=('git')
provides=('sparklines')
conflicts=('sparklines')
source=("git://github.com/holman/$_pkgname.git")
sha256sums=('SKIP')

pkgver() {
	cd "$srcdir/$_pkgname"
	git describe --always | sed "s/-/./g"
}

package() {
	cd "$srcdir/$_pkgname"
	install -D spark "$pkgdir/usr/bin/sparklines"
	install -D "README.md" "$pkgdir/usr/share/doc/spark/README.md"
}
