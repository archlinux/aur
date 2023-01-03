# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=run-one
pkgver=1.17
pkgrel=3
pkgdesc="Run just one instance of a command and its args at a time"
arch=('any')
url="https://launchpad.net/run-one"
license=('GPL3')
depends=('sh')
source=("$pkgname-$pkgver.tgz::$url/trunk/$pkgver/+download/${pkgname}_$pkgver.orig.tar.gz")
sha256sums=('b7c9b257b52f29ba0d923a4dfee4edd47332ebeca0200c65f309eb6ae33f701f')

package() {
	cd "$pkgname-$pkgver"
	install -Dvt "$pkgdir/usr/bin/" \
		run-one \
		keep-one-running \
		run-one-constantly \
		run-one-until-failure \
		run-one-until-success \
		run-this-one
	install -Dvm644 "$pkgname.1" -t "$pkgdir/usr/share/man/man1/"
}
