# Maintainer: Emil Miler <em@0x45.cz>

pkgname=tripforce-git
pkgdesc="Tripcode bruteforcer for Futaba-style imageboards"
pkgver=r23.22d8c70
pkgrel=2
arch=('any')
url="https://github.com/microsounds/tripforce"
license=('GPL3')
depends=('openssl')
makedepends=('git')
provides=('tripforce')
conflicts=('tripforce')
source=("$pkgname::git+https://github.com/microsounds/tripforce.git")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/$pkgname"
	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
	cd "$srcdir/$pkgname"
	mkdir -p "$pkgdir"/usr/bin
	make INSTALLDIR="$pkgdir/usr/bin" install
}
