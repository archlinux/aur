pkgname=psp-pthreads-emb
pkgver=1.0
pkgrel=1
pkgdesc="POSIX Threads for embedded systems (psp)"
arch=('any')
url="http://pthreads-emb.sourceforge.net/"
license=('LGPL')
depends=('psp-sdk' 'psp-pspirkeyb')
makedepends=('psp-gcc')
options=('staticlibs' '!buildflags' '!strip')
source=("git+https://github.com/jschmidlapp/pthreads-emb.git")
md5sums=('SKIP')

build() {
  cd "$srcdir"/pthreads-emb
  make -C platform/psp TARGET_LIB=libpthread.a
}

package() {
  cd "$srcdir"/pthreads-emb
  make -C platform/psp DESTDIR="$pkgdir" TARGET_LIB=libpthread.a install
}

