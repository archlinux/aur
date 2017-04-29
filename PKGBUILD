# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=freebsd-docs-handbook
pkgver=50188
pkgrel=1
pkgdesc="The FreeBSD Handbook from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books/handbook/book.html-split.tar.bz2")
md5sums=('b341738b2e6dae2621d37652453cfb8f')

prepare() {
    rm $srcdir/book.html-split.tar.bz2    
    msg2 'Correcting paths in html files'
    for j in $(ls $srcdir/*.html); do
        sed -i 's:/local0/docbuild/build/doc/en_US.ISO8859-1/books/handbook/../../../share/images/books:/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books:g' $j        
    done 
}
package() {
    install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/handbook
    cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/handbook/
}
