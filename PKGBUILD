# Maintainer: Boris Barbulovski <bbarbulovski@gmail.com>
pkgname=libdspl
pkgver=2.0
pkgrel=1
_git_ref='945a7fd417dab398a950ebc2557b3dcae109c7df'
pkgdesc='Opensource cross-platform digital signal processing algorithm library, written in C language.'
arch=('x86_64' 'i686')
url='https://github.com/Dsplib/libdspl-2.0'
license=('LGPL3')
makedepends=('make' 'gcc' 'gcc-fortran' 'blas')
depends=('glibc' 'gcc-libs')

source=("https://github.com/Dsplib/libdspl-2.0/archive/${_git_ref}.tar.gz")
sha1sums=('435333d6f5052a9000c72f26344d5046353e29ab')

build() {
	cd "${srcdir}/${pkgname}-${pkgver}-${_git_ref}"
	make -C dspl ../_release/libdspl.so
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}-${_git_ref}"
	install -Dm644 _release/dspl.h "$pkgdir/usr/include/dspl.h"
	install -Dm644 _release/libdspl.so "$pkgdir/usr/lib/libdspl.so"
}
