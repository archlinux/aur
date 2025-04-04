# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dot com>
# Contributor: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Simon Legner <Simon.Legner@gmail.com>

pkgname=run-one
pkgver=1.18
pkgrel=1
pkgdesc="Run just one instance of a command and its args at a time"
arch=('any')
url="https://github.com/dustinkirkland/run-one"
license=('GPL-3.0-or-later')
depends=('sh')
source=("$pkgname-$pkgver.tgz::${url}/archive/refs/tags/${pkgver}.tar.gz")

sha256sums=('6cbc8e375701cc231c6247be676d6201aa6d6e716a448f1603abb949d370bcae')

package() {
	cd "$pkgname-$pkgver" || exit

	install -Dvt "$pkgdir/usr/bin/" \
		run-one \
		keep-one-running \
		run-one-constantly \
		run-one-until-failure \
		run-one-until-success \
		run-this-one

	install -Dvm644 "$pkgname.1" -t "${pkgdir}/usr/share/man/man1/"

	install -Dm644 "COPYING" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
