# Maintainer: Stunts <f.pinamartins@gmail.com>

pkgname=staden-io_lib
pkgver=1.13.3
pkgrel=1
pkgdesc="A fully developed set of DNA sequence assembly (Gap4), editing and analysis tools (Spin) for Unix, Linux, MacOSX and MS Windows. Library files."
arch=('i686' 'x86_64')
url="http://staden.sourceforge.net/"
license=('BSD')
depends=('curl')
source=(http://downloads.sourceforge.net/project/staden/io_lib/$pkgver/io_lib-$pkgver.tar.gz)
md5sums=('819393d28cb0a8606242e5a8445f6ac1')

build() {
    cd "$srcdir/io_lib-$pkgver"
    ./configure --prefix=/usr
    make CFLAGS=-g 
}

package() {
    cd "$srcdir/io_lib-$pkgver"
    make DESTDIR="$pkgdir" install
}

