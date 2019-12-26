# Maintainer: C. Dominik Bódi <dominik dot bodi at gmx dot de>
# Current Maintainer: Thomas Koller-Cherek <tk120 at protonmail dot com>

pkgname=zsync-curl-git 
pkgver=r80.1382cf4
pkgrel=1
pkgdesc="Partial/differential file download client over HTTP(S)"
arch=('any')
url="https://github.com/probonopd/zsync-curl"
license=('Artistic2.0')
depends=('curl')
makedepends=('git' 'gcc' 'make')
source=('git+https://github.com/probonopd/zsync-curl.git')
md5sums=('SKIP')
provides=("zsync-curl")
conflicts=("zsync-curl")

build() {
	cd "$srcdir/${pkgname%-git}/src"
	./configure
	make -j $(nproc)
}

check() {
	cd "$srcdir/${pkgname%-git}/src"
	make -k check
}

package() {
	cd "$srcdir/${pkgname%-git}/src"
	make DESTDIR="$pkgdir/"
}
