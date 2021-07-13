# Maintainer: ed sandberg <scarypezsanta at gmail dot com>
pkgname=vsmartcard
pkgver=0
pkgrel=8
pkgdesc="Virtual Smart Card emulates a smart card."
arch=('x86_64')
url="https://frankmorgner.github.io/vsmartcard/virtualsmartcard/README.html"
license=('GPL')
depends=("libtool" "pkg-config")
makedepends=("make")
source=("https://github.com/frankmorgner/vsmartcard/releases/download/virtualsmartcard-$pkgver.$pkgrel/virtualsmartcard-$pkgver.$pkgrel.tar.gz")
sha256sums=("bf195a4c4b40d16bbd3114a0319f1bec154f44c6b1620f2c6a568b8eafcfee37")

build() {
    cd "$srcdir/virtualsmartcard-$pkgver.$pkgrel"
    ./configure --sysconfdir=/etc
    make
}

package() {
    cd "$srcdir/virtualsmartcard-$pkgver.$pkgrel"
    make DESTDIR="$pkgdir/" install
    cd $pkgdir/usr/local/share/
    mv man vsmartcard_man
}
