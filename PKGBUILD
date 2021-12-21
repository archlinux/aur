# Maintainer: AlphaJack <alphajack at tuta dot io>
# Contributor: Brian Bidulock <bidulock@openss7.org>
# Contributor: Eric Bélanger <eric@archlinux.org>

pkgname="xsnow-legacy"
pkgver=1.42
pkgrel=1
pkgdesc="Display snow, Santa and his reindeers on the root window"
url="https://janswaal.home.xs4all.nl/Xsnow/"
license=("custom")
arch=("x86_64" "i686")
depends=("libxpm")
makedepends=("imake")
conflicts=("xsnow" "xsnow-bin")
source=("https://janswaal.home.xs4all.nl/Xsnow/xsnow-$pkgver.tar.gz"
        "LICENSE")
sha256sums=("d0d7c8f1fb91ca096995b1c30797e8f443c2e97d6f1e5f574b31318ed05d561a"
            "4b611ecb33d955613a7f2448f245515d0e2c4ca2f309023098b3f7dd56a62093")

build(){
 cd "xsnow-$pkgver"
 xmkmf
 make depend
 make
}

package(){
 cd "xsnow-$pkgver"
 make DESTDIR="$pkgdir" install install.man
 chmod 644 "$pkgdir/usr/share/man/man1/xsnow.1x"
 install -D -m 644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
