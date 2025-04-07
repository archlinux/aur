# Maintainer: Alice Vega <aalicevegaa at protonmail dot com>
# Contributor: SanskritFritz (gmail)
# Contributor: Brian Bidulock <bidulock@openss7.org>
 
pkgname=wmgtemp
pkgver=1.2
pkgrel=1
pkgdesc="Dockapp to graphically display CPU and SYS temperatures."
url="https://www.dockapps.net/wmgtemp"
arch=('i686' 'x86_64')
license=('GPL2')
depends=('libxpm' 'lm_sensors')
source=("https://www.dockapps.net/download/wmgtemp-1.2.tar.gz")
md5sums=('a595053ba7fab25e318d983df3af8ce8')
 
prepare() {
    cd "$pkgname-$pkgver"
    ./configure
}

build() {
    cd "$pkgname-$pkgver"
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

    if [[ -f "HINTS" ]]; then
	install -m 644 -D "HINTS" "$pkgdir/usr/share/doc/$pkgname/HINTS"
    fi

    if [[ -f "TODO" ]]; then
	install -m 644 -D "TODO" "$pkgdir/usr/share/doc/$pkgname/TODO"
    fi

    if [[ -f "BUGS" ]]; then
	install -m 644 -D "BUGS" "$pkgdir/usr/share/doc/$pkgname/BUGS"
    fi
}
