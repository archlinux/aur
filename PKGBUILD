# Maintainer: M0Rf30

pkgname=oyranos
pkgver=0.9.5
pkgrel=2
pkgdesc="A Colour Management System (CMS) on operating system level."
url="http://oyranos.org/"
arch=('i686' 'x86_64')   
makedepends=(cmake yajl)
depends=(libxml2 libxinerama libxrandr libxfixes libxxf86vm doxygen graphviz lcms2 libraw libxcm)
optdepends=(fltk qt elektra exiv2 cups sane cairo openicc xcalib)
source=("http://prdownloads.sourceforge.net/oyranos/$pkgname-$pkgver.tar.bz2")
license=('MIT')

build() {
    cd $srcdir/$pkgname-$pkgver
    
    ./configure --prefix=/usr --enable-threads --enable-xft --enable-shared --libdir=/usr/lib
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR=$pkgdir install
}

md5sums=('f59ef03182597e1e7ba0e434599eb0c4')
