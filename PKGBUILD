# Maintainer: Rafael Dominiquini <rafaeldominiquini at gmail dor com>
# Contributor: Moritz Luedecke <ritze@skweez.net>

pkgname=dup
pkgver=20160409
pkgrel=2
pkgdesc="du with progress bar in pacman style"
url="https://github.com/ritze/dup"
license=('GPL')
arch=('any')
makedepends=('git')
depends=('bash' 'pbar')
conflicts=("${pkgname}")
provides=("${pkgname}")
source=("${pkgname}::git+https://github.com/ritze/dup.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"

	git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
	install -Dm755 "$srcdir/$pkgname/dup" "$pkgdir/usr/bin/dup"

	install -Dm644 "$srcdir/$pkgname/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
