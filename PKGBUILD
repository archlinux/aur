# Maintainer: Alice Vega <aalicevegaa at proton mail dot com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Alexej Magura <agm2819*gmail*com>
# Contributor: libernux <dutchman55l@gmx.com>
# Contributor: Brian Bidulock <bidulock@openss7.org>

pkgname=wmcore
pkgver=0.0.4
pkgrel=1
pkgdesc="A windowmaker dockapp which shows the usage of each core in the system"
arch=('i686' 'x86_64')
#url="http://dockapps.windowmaker.org/file.php/id/362"
url="https://www.dockapps.net/wmcore"
license=('GPL')
depends=('libxpm')
source=("https://www.dockapps.net/download/${pkgname}-${pkgver}.tar.xz")
md5sums=('77c765a11844f1f60f10f549653b88d4')

prepare() {
    cd $pkgname-$pkgver
    ./configure
}

build() {
    cd $pkgname-$pkgver
    make 
}

package() {
    cd $pkgname-$pkgver
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

