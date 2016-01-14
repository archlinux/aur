# Maintainer: Moritz Luedecke <ritze@skweez.net>
pkgname=dfp
pkgver=20141004
pkgrel=2
pkgdesc="df with progress bar in pacman style"
url="https://github.com/ritze/dfp"
license="GPL"
arch=('any')
makedepends=('git')
depends=('bash' 'pbar')
source=("${pkgname}::git+https://github.com/ritze/dfp.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
	install -Dm755 "$srcdir/$pkgname/dfp" "$pkgdir/usr/bin/dfp"
}
