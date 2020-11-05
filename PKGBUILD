pkgname=kerpack-svn
pkgver=r8139
pkgrel=1
pkgdesc="A program for compressing apps and the KolibriOS kernel using the LZMA method."
url="https://board.kolibrios.org/viewtopic.php?f=1&t=768"
arch=('any')
license=('GPLv3')
makedepends=('svn')
source=("svn://kolibrios.org/programs/other/kpack/kerpack_linux")
md5sums=('SKIP')
provides=('kerpack')
pkgver() 
{
    cd $srcdir/kerpack_linux
    echo r$(svnversion)
}

build()
{ 
    cd $srcdir/kerpack_linux
    make
}

package() 
{
     install -Dm777 $srcdir/kerpack_linux/kerpack $pkgdir/usr/bin/kerpack
}
