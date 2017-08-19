# Maintainer: Daniel Lima <danielm@nanohub.tk>

pkgname=gsl-shell
pkgver=2.3.1
pkgrel=1
pkgdesc='GNU Scientific Library shell based on LuaJIT2'
url='http://http://www.nongnu.org/gsl-shell'
license=('GPL3')
depends=('agg' 'blas' 'lapack' 'gsl' 'readline' 'freetype2' 'fox')
makedepends=('git')
arch=('i686' 'x86_64')
source=("git://github.com/franko/gsl-shell#tag=v$pkgver")
sha256sums=('SKIP')

build() {
	cd "$srcdir/$pkgname"
	make clean
	make PREFIX="/usr"
}

package() {
	cd "$srcdir/$pkgname"
	make install DESTDIR="$pkgdir" PREFIX="/usr"
}
