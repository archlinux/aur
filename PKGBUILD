pkgname=cmm
groups=('kos32-dev')
pkgver=0.240
pkgrel=2
pkgdesc="SPHINX C-- Compiler . C-- is a programming language occupying an intermediate position between Assembler and C."
url="http://c--sphinx.narod.ru/"
source=("https://github.com/XVilka/cminusminus/archive/v${pkgver}.tar.gz")
license=('GPLv3')
arch=('any')
makedepends=('cmake' 'gcc' 'make')
conflicts=('cmm-git')
md5sums=('SKIP')

build(){
   cd $srcdir/cminusminus-${pkgver}
   mkdir -p build 
   cd build
   cmake ..  
   make
}

package() {
    mkdir -p $pkgdir/usr/bin
    mkdir -p $pkgdir/usr/share/doc/cmm
    cp $srcdir/cminusminus-${pkgver}/build/c-- $pkgdir/usr/bin
    cp -r $srcdir/cminusminus-${pkgver}/doc/* $pkgdir/usr/share/doc/cmm
    echo -e "\e[35mDocumentation will be available in '/usr/share/doc/cmm'\e[0m"
}


