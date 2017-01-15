# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=freebsd-docs-arch-handbook
pkgver=49607
pkgrel=2
pkgdesc="The FreeBSD Architecture Handbook from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books/arch-handbook/book.html-split.tar.bz2")
md5sums=('2165798a98bb2c920f2031cfccdb5a2f')

prepare() {
    rm $srcdir/book.html-split.tar.bz2
    msg2 'Correcting paths in html files'
    for j in $(ls $srcdir/*.html); do
        sed -i 's:/local0/docbuild/build/:/usr/share/doc/freebsd/:g' $j        
    done     
}
package() {
    install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/arch-handbook
    cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/arch-handbook/
}
