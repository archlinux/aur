# Maintainer: Tobias Frisch <thejackimonster@gmail.com>

_pkgname=libpep-adapter
pkgname=$_pkgname-hg
pkgver=r168.e8fe371c870a
pkgrel=1
pkgdesc="C++ library for common structures used in p≡p adapters"
arch=('x86_64' 'i686')
url='https://pep.foundation/dev/repos/libpEpAdapter'
license=('GPL3')
makedepends=('mercurial' 'make' 'pep-engine')
depends=('pep-engine')
provides=('libpep-adapter')
source=("hg+https://pep.foundation/dev/repos/libpEpAdapter")
md5sums=('SKIP')

pkgver() {
	cd "$srcdir/libpEpAdapter"

	printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
	cd "$srcdir/libpEpAdapter"
	
	echo "PREFIX=$pkgdir/usr" > 'local.conf'
	echo "ENGINE_LIB=-L/usr/lib" >> 'local.conf'
    echo "ENGINE_INC=-I/usr/include" >> 'local.conf'

	make all
}

package() {
	cd "$srcdir/libpEpAdapter"
	
	make install
}

