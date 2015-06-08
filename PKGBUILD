# Maintainer: Moritz Luedecke <ritze@skweez.net>
pkgname=dup
pkgver=20141004
pkgrel=1
pkgdesc="du with progress bar in pacman style"
url="https://github.com/ritze/dup"
license="GPL"
arch=('any')
makedepends=('git')
depends=('bash' 'pbar')
source=("${pkgname}::git+https://github.com/ritze/dup.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
	install -Dm755 "$srcdir/$pkgname/dup" "$pkgdir/usr/bin/dup"
}
