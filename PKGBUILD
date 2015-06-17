# Maintainer: M0Rf30

pkgname=strobe
pkgver=1.06
pkgrel=2
pkgdesc="Super optimised TCP port surveyor (in honour of Julian Assange)"
arch=('i686' 'x86_64')
license=('GPL2')
url="http://ftp.cerias.purdue.edu/pub/tools/unix/scanners/strobe/"
source=("http://ftp.cerias.purdue.edu/pub/tools/unix/scanners/strobe/$pkgname-$pkgver.tar.gz")

build() {
	cd $srcdir/$pkgname
        make
}

package(){
	cd $srcdir/$pkgname
        mkdir -p $pkgdir/usr/{lib,man,bin}
        mkdir -p $pkgdir/usr/man/man1
        make INSTALLDIR=$pkgdir/usr/bin \
	LIBDIR=$pkgdir/usr/lib MANDIR=$pkgdir/usr/man/man1 install
        
}

md5sums=('ec976426618e32f7440a4495e8c858e9')
