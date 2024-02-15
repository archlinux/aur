# Maintainer: vmalloc vmalloc@olanfa.de
pkgname=TinyLock
pkgver=1.20
pkgrel=1
pkgdesc="provides a lock function for process locking"
arch=('i686' 'x86_64')
url="https://jeremy.kister.net/code/File-TinyLock-1.20/README"
license=('Artistic License')
depends=('perl')
makedepends=(make)
source=("https://jeremy.kister.net/code/File-TinyLock-$pkgver.tgz")

sha256sums=('b2f61184e51b9a51b7e129fbda289ed49afb7289df8db788318503898782d27e')

build() {
  cd "$srcdir/File-TinyLock-$pkgver"
  perl Makefile.PL || return 1
  make || return 1
  make test || return 1
}

package() {
	cd "${srcdir}"/File-TinyLock-${pkgver}
	make install DESTDIR="${pkgdir}"
}

