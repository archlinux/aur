# Maintainer: Alice Vega <aalicevegaa at proton mail dot com>
pkgname=wmusic
pkgver=2.1.1
pkgrel=1
pkgdesc="wmusic is a dockapp that remote-controls MPRIS-compatible media players"
arch=('i686' 'x86_64')
url="https://www.dockapps.net/wmtime"
license=('GPL')
depends=('libxpm' 'libdockapp' 'playerctl')
source=("https://www.dockapps.net/download/${pkgname}-${pkgver}.tar.gz")
md5sums=('37965b256dfac7a9771f82e6954db54d')

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
