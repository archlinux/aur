pkgname=cmm-svn
pkgver=r8466
pkgrel=1
pkgdesc="SPHINX C-- Compiler . C-- is a programming language occupying an intermediate position between Assembler and C."
url="http://c--sphinx.narod.ru/"
makedepends=('svn')
source=("svn://kolibrios.org/programs/develop/cmm")
license=('GPLv3')
arch=('i686' 'x86_64')
conflicts=('cmm')
md5sums=('SKIP')
provides=('cmm' 'c--')

pkgver() {
    cd $srcdir/cmm
    echo r$(svnversion)
}

build() {
   cd cmm
   make -f Makefile.lin32
   rm *.o
}

package() {
    mkdir -p $pkgdir/usr/bin
    install -Dm755 $srcdir/cmm/c-- $pkgdir/opt/cmm/c--
    install -Dm644 $srcdir/cmm/c--.ini $pkgdir/opt/cmm/c--.ini
    ln -s /opt/cmm/c-- $pkgdir/usr/bin/c--
} 
