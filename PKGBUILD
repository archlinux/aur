# Maintainer: gigas002 <gigas002@pm.me>

pkgname=clunk-vangers-git
_pkgname=clunk
pkgver=r148.6d4cbbe
pkgrel=5
pkgdesc="Vangers for of clunk library"
arch=('x86_64')
url="https://github.com/stalkerg/$_pkgname"
license=('LGPL2.1')
makedepends=('git' 'cmake' 'make' 'sdl2')
provides=("clunk")
conflicts=('clunk' 'libclunk' 'clunk-git' 'libclunk-git' 'clunk-vangers')
source=("git+$url.git")
sha256sums=('SKIP')

pkgver() {
	cd $srcdir/$_pkgname
  	printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
    cd $srcdir/$_pkgname
    cmake -DCMAKE_INSTALL_PREFIX=/usr . #-DCMAKE_C_COMPILER=gcc -DCMAKE_CXX_COMPILER=g++ .
    make
}

package() {
    install -d $pkgdir/usr/lib
    cp $srcdir/$_pkgname/lib$_pkgname.so $pkgdir/usr/lib/lib$_pkgname.so

    install -d $pkgdir/usr/include/clunk
    cp $srcdir/$_pkgname/$_pkgname.h $pkgdir/usr/include/$_pkgname/$_pkgname.h
    cp $srcdir/$_pkgname/buffer.h  $pkgdir/usr/include/$_pkgname/buffer.h
    cp $srcdir/$_pkgname/clunk_c.h $pkgdir/usr/include/$_pkgname/clunk_c.h
    cp $srcdir/$_pkgname/context.h $pkgdir/usr/include/$_pkgname/context.h
    cp $srcdir/$_pkgname/export_clunk.h $pkgdir/usr/include/$_pkgname/export_clunk.h
    cp $srcdir/$_pkgname/locker.h $pkgdir/usr/include/$_pkgname/locker.h
    cp $srcdir/$_pkgname/mdct_context.h $pkgdir/usr/include/$_pkgname/mdct_context.h
    cp $srcdir/$_pkgname/sample.h $pkgdir/usr/include/$_pkgname/sample.h
    cp $srcdir/$_pkgname/sse_fft_context.h $pkgdir/usr/include/$_pkgname/sse_fft_context.h
    cp $srcdir/$_pkgname/v3.h $pkgdir/usr/include/$_pkgname/v3.h
    cp $srcdir/$_pkgname/clunk_assert.h $pkgdir/usr/include/$_pkgname/clunk_assert.h
    cp $srcdir/$_pkgname/distance_model.h $pkgdir/usr/include/$_pkgname/distance_model.h
    cp $srcdir/$_pkgname/fft_context.h $pkgdir/usr/include/$_pkgname/fft_context.h
    cp $srcdir/$_pkgname/logger.h $pkgdir/usr/include/$_pkgname/logger.h
    cp $srcdir/$_pkgname/object.h $pkgdir/usr/include/$_pkgname/object.h
    cp $srcdir/$_pkgname/source.h $pkgdir/usr/include/$_pkgname/source.h
    cp $srcdir/$_pkgname/stream.h $pkgdir/usr/include/$_pkgname/stream.h
}
