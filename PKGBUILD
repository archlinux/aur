# Maintainer: Daniel Lima <danielmariodelima@gmail.com>

pkgname=gsl-shell
pkgver=2.3.1
pkgrel=2
pkgdesc='GNU Scientific Library shell based on LuaJIT2'
url='http://www.nongnu.org/gsl-shell'
license=('GPL3')
depends=('agg' 'blas' 'lapack' 'gsl' 'readline' 'freetype2' 'fox')
makedepends=('git')
arch=('i686' 'x86_64')
source=("http://download.savannah.gnu.org/releases/gsl-shell/gsl-shell-${pkgver}.tar.gz")
sha256sums=('fbef3fdcfb25bf7d2a2d87c93954ebbb0104077efd5fde0254ccc008e0a6f535')

build() {
	cd "$srcdir/$pkgname-$pkgver"
	patch makepackages ../../makepackages.patch
	make clean
	make PREFIX="/usr"
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make install DESTDIR="$pkgdir" PREFIX="/usr"
}
