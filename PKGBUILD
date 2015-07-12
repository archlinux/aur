# Maintainer: 10sr <8slashes+arch [at] gmail [dot] com>

pkgname=gauche-readline
pkgver=20100625
pkgrel=1
pkgdesc="Readline module for gauche REPL"
arch=('i686' 'x86_64')
url="http://www.netlab.is.tsukuba.ac.jp/~yokota/izumi/gauche/"
# What is the license??
#license=('BSD')
depends=('readline')
#makedepends=('')
# provides=('libcurl.so')
# options=('strip' 'debug')
source=("http://www.netlab.is.tsukuba.ac.jp/~yokota/archive/Gauche-readline-$pkgver.tar.gz")
md5sums=('d2f4b71feb7533ca73218680c37521ed')


build(){
    cd "$srcdir"/Gauche-readline-$pkgver
    # I know using pkgdir here is not good, but cannot use DESTDIR= when
    # running `make install` !
    ./configure --prefix="$pkgdir"/usr
    make
}

package(){
    cd "$srcdir"/Gauche-readline-$pkgver
    make install
}
