# Maintainer: M0Rf30 <morf3089@gmail.com>

pkgname=k-izer
pkgver=0.3
pkgrel=2
pkgdesc="Karnaughizer is a simple Karnaugh map minimizer" 
arch=('i686' 'x86_64') 
url="http://lonelydeveloper.org/projects" 
depends=('fltk') 
makedepends=("cmake")
license=('GPL') 
source=("http://lonelydeveloper.org/workspace/files/k-izer-$pkgver-src.tgz" 'patch') 

build()
{
   cd $srcdir/$pkgname-$pkgver-src
   patch -i ../patch
   cmake .
   make
}

package(){
   mkdir -p $pkgdir/usr/bin && cp $srcdir/$pkgname-$pkgver-src/k-izer $pkgdir/usr/bin
}

md5sums=('40d1bec7de9b6b0014e11af0ac08a67e'
         'd9cf38cba88c3518cd4c0441c01f8fa0')
