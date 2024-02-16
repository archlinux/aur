# Maintainer: vmalloc vmalloc@olanfa.de
pkgname=tinylock
pkgver=1.20
pkgrel=1
pkgdesc="provides a lock function for process locking"
arch=('i686' 'x86_64')
url="https://jeremy.kister.net/code/File-TinyLock-1.20/README"
license=('Artistic License')
depends=('perl')
makedepends=(make)
source=("https://jeremy.kister.net/code/File-TinyLock-$pkgver.tgz")

sha512sums=('f64015000b64346bc243db912c66cb0fb3a6642dddb1cbff40778176c3ca395bb01e36f6e4b5d762573ac731a0cfcbb942b965c2282613b9ebc2c955147f799b')


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

