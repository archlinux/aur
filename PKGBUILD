# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Moritz Luedecke <ritze@skweez.net>

pkgname=dfp
pkgver=20160409
pkgrel=2
pkgdesc="df with progress bar in pacman style"
url="https://github.com/ritze/dfp"
license=('GPL')
arch=('any')
makedepends=('git')
depends=('bash' 'pbar')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("${pkgname}::git+https://github.com/ritze/dfp.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"

	git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
	install -Dm755 "$srcdir/$pkgname/dfp" "$pkgdir/usr/bin/dfp"

	install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
