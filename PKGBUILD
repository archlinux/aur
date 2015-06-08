# Maintainer: Moritz Luedecke <ritze@skweez.net>
# Contributor: Gilrain <pierre.buard+aur gmail com>
# Contributor: bruenig
pkgname=pbar
pkgver=20150414
pkgrel=1
pkgdesc="Progress bar in pacman style"
url="https://github.com/ritze/pbar"
license="GPL"
arch=('any')
makedepends=('git')
depends=('bash')
conflicts=('pbar')
source=("${pkgname}::git+https://github.com/ritze/pbar.git#branch=master")
md5sums=('SKIP')

pkgver() {
	cd "$pkgname"
	git show -s --format="%ci" HEAD | sed -e 's/-//g' -e 's/ .*//'
}

package() {
	install -Dm755 "$srcdir/$pkgname/pbar" "$pkgdir/usr/bin/pbar"
}
