# Maintainer: Mohammadreza Abdollahzadeh <morealaz at gmail dot com>
pkgname=freebsd-docs-committers-guide
pkgver=49914
pkgrel=1
pkgdesc="The Committer's Guide from the FreeBSD Documentation Project."
arch=(any)
url="https://www.freebsd.org/docs.html"
license=('BSD')
source=("ftp://ftp.freebsd.org/pub/FreeBSD/doc/en_US.ISO8859-1/articles/committers-guide/article.html-split.tar.bz2")
md5sums=('6f70438c4e247e88d670f68f89b14f53')

prepare() {
    rm $srcdir/article.html-split.tar.bz2
    msg2 'Correcting paths in html files'
    for j in $(ls $srcdir/*.html); do
        sed -i 's:/local0/docbuild/build/:/usr/share/doc/freebsd/:g' $j        
    done        
}
package() {
    install -d $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/articles/committers-guide
    cp -a ./* $pkgdir/usr/share/doc/freebsd/doc/en_US.ISO8859-1/articles/committers-guide/
}
