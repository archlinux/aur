# Maintainer: Jonas Gunz <arch@jonasgunz.de>
# Former Maintainer : Jay Tsung<int8@foxmail.com>
# Contributor: <aur@entropy-collector.net>

pkgname=libradtran
_pkgname=libRadtran
pkgver=2.0.6
pkgrel=1
pkgdesc="library for radiative transfer"
arch=('x86_64')
url="http://www.libradtran.org"
license=('GPL')
depends=('netcdf'
         'gsl')
makedepends=('python'
             'gcc-fortran')
optdepends=('perl: run the tests and some of the tools')
source=("http://www.libradtran.org/download/$_pkgname-$pkgver.tar.gz")
sha256sums=('64930cc40b6e4a37aa220520974d330fc1563796f466a649b2238131f2d69840')

prepare() {
	cd "$_pkgname-$pkgver"
	find -name .depend -delete
}

build() {
	cd "$_pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$_pkgname-$pkgver"
	make prefix="$pkgdir/usr/" install
}
