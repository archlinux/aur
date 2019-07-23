# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=dibuja
pkgver=0.10.0
pkgrel=1
pkgdesc="Gtk based basic paint program like classic MS Paint or Paintbrush for Mac but for Linux"
url="https://launchpad.net/dibuja"
source=("https://launchpad.net/dibuja/trunk/$pkgver/+download/dibuja-$pkgver.tar.gz")
md5sums=('4525944e0e3d23cdaa2e4720deca2466')
license=("GPL3")
arch=("x86_64")
depends=(gtk2 gegl)

build() {
    cd "$srcdir/$pkgname-$pkgver"
    autoconf
    ./configure --prefix=/usr --libdir=/usr/lib --with-gegl-0.4
    make
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
