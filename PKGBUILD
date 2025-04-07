# Maintainer: Alice Vega <aalicevegaa at proton mail dot com>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Henrik Tunedal <henrik at tunedal dot nu>
pkgname=wmtime
pkgver=1.4
pkgrel=1
pkgdesc="Analog/digital clock dockapp for Window Maker"
arch=('i686' 'x86_64')
url="https://www.dockapps.net/wmtime"
license=('GPL')
depends=('libxpm' 'libdockapp')
source=("https://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('b4efbb4113ad4f1252cf5488796789dd')

build() {
    cd "$srcdir/dockapps-7d1ef92"
    make
}

package() {
    cd "$srcdir/dockapps-7d1ef92"
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
