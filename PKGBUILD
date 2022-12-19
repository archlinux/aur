# Maintainer: Sam Close <sam dot w dot close at gmail dot com> 
# Contributor:  Imants Dureika <imants dot dureika at gmail dot com>
pkgname=xdemineur
pkgver=2.1.1
pkgrel=1
pkgdesc="A minesweeper game for the X Window System."
arch=('i686' 'x86_64')
url="http://www.babafou.eu.org/xdemineur/"
license=('custom') # Copyright � 1993-1999 Marc Baudoin <babafou at babafou dot eu dot org>
makedepends=('imake')
depends=('libx11' 'libxpm')
source=("https://web.archive.org/web/20210126091102/http://www.babafou.eu.org/xdemineur/xdemineur-2.1.1.tar.gz"
"xdemineur.desktop")
sha256sums=('593824412a208a1b75d5b15745a271dc3eba330d41f7718f4826567d04bcbb9b'
'759f5792195458974453853b4c6238cb8bc39c7ec099d935f7d3cff154d2ac27'
)

build() {
    cd $pkgname-$pkgver
    xmkmf
    make
}

package() {
    cd $pkgname-$pkgver
    make DESTDIR="$pkgdir/" install
    install -Dm644 "../xdemineur.desktop" "$pkgdir/usr/share/applications/xdemineur.desktop" # I'm sure ../ is not the correct way to refer to this file, but it works for now
}
