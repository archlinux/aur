# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexej Magura <agm2819*gmail*com>
# Contributor: libernux <dutchman55l@gmx.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=wmcore
pkgver=0.0.2
pkgrel=11
pkgdesc="A windowmaker dockapp which shows the usage of each core in the system"
arch=('i686' 'x86_64')
#url="http://dockapps.windowmaker.org/file.php/id/362"
url="http://web.archive.org/web/20121114121553/http://dockapps.windowmaker.org/file.php/id/362"
license=('GPL')
depends=('libxpm')
#source=("http://dockapps.windowmaker.org/download.php/id/917/${pkgname}-${pkgver}.tar.gz")
source=("${pkgname}-${pkgver}.tar.gz")
md5sums=('26899aba55f84e649178ab8ab18f331e')

prepare() {
    cd "$srcdir/$pkgname-$pkgver"
    
    make clean

}

build() {
    
    cd "$srcdir/$pkgname-$pkgver"
    
    make 
}

package() {
    
    cd "$srcdir/$pkgname-$pkgver"

   install -m 755 -D "$pkgname" "$pkgdir/usr/bin/$pkgname"

    if [[ -f "README" ]]; then
	install -m 644 -D "README" "$pkgdir/usr/share/doc/$pkgname/README"
    fi
    
    if [[ -f "CHANGES" ]]; then
	install -m 644 -D "CHANGES" "$pkgdir/usr/share/doc/$pkgname/CHANGES"
    fi
    
    if [[ -f "COPYING" ]]; then
	install -m 644 -D "COPYING" "$pkgdir/usr/share/doc/$pkgname/COPYING"
    fi

}

