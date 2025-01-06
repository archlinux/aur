# Maintainer: Romain Labolle <romain@labolle.eu>
pkgname=libit
pkgver=0.2.3
pkgrel=3
pkgdesc="Easy to use yet efficient tools for C for signal processing, coding, or scientific code in general"
arch=(i686 x86_64)
url="http://libit.sf.net/"
license=('LGPLv2')
source=("http://downloads.sourceforge.net/${pkgname}/${pkgname}-${pkgver}.tar.gz")
md5sums=('34c332ec0dd7ef4af830a7c7f326228d')

prepare() {
    cd "$srcdir/${pkgname}-${pkgver}"
    sed -i 's/^docdir/docdir = @/' doc/Makefile.am
    sed -i 's/^docdir = .*$/docdir = @docdir@/' doc/Makefile.in
}

build() {
    cd "$srcdir/${pkgname}-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$srcdir/${pkgname}-${pkgver}"
    make prefix="${pkgdir}/usr" install
}
