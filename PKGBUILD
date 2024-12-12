# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Moritz Luedecke <ritze@skweez.net>
# Contributor: Gilrain <pierre.buard+aur gmail com>
# Contributor: bruenig

pkgname=pbar
pkgver=20160830
pkgrel=2
pkgdesc="Progress bar in pacman style"
url="https://github.com/ritze/pbar"
license=('GPL')
arch=('any')
makedepends=('git')
depends=('bash')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("${pkgname}::git+https://github.com/ritze/pbar.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"

	git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
	install -Dm755 "$srcdir/$pkgname/pbar" "$pkgdir/usr/bin/pbar"

	install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
