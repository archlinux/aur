# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=freebsd-docs-developers-handbook
pkgver=49455
pkgrel=1
pkgdesc="The FreeBSD Developers' Handbook from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/books/developers-handbook/book.html-split.tar.bz2")
md5sums=('f86471d34b17d9c2c403659103029cea')

prepare() {
    rm $srcdir/book.html-split.tar.bz2
    msg2 'Correcting paths in html files'
    for j in $(ls $srcdir/*.html); do
        sed -i 's:/local0/docbuild/build/doc/en_US.ISO8859-1/books/developers-handbook/../../../share/images/books:/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books:g' $j        
    done     
}
package() {
    install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/developers-handbook
    cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/books/developers-handbook/
}
