# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Tristan Rice <rice@fn.lc>
# Contributor: Dan Buch <dan@meatballhat.com>

pkgname=gimme-git
_pkg="${pkgname%-git}"
pkgver=1.7.1.r0.gb4585b0
pkgrel=1
pkgdesc="Shell script for installing Go"
arch=('any')
url="https://github.com/urfave/gimme"
license=('MIT')
depends=('bash')
makedepends=('git')
provides=("$_pkg")
conflicts=("$_pkg")
source=("$_pkg::git+$url")
sha256sums=('SKIP')

pkgver() {
	git -C "$_pkg" describe --long --tags | sed 's/^v//;s/-/.r/;s/-/./'
}

package() {
	cd "$_pkg"
	install -Dv "$_pkg" -t "$pkgdir/usr/bin/"
	install -Dvm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname/"
}
