# Maintainer: Daniel Milde <daniel at milde dot cz>

pkgname=dibuja
pkgver=0.6.0
pkgrel=2
pkgdesc="Gtk based basic paint program like classic MS Paint or Paintbrush for Mac but for Linux"
url="https://launchpad.net/dibuja"
source=("https://launchpad.net/dibuja/trunk/$pkgver/+download/dibuja-$pkgver.tar.gz")
md5sums=('2cbf426a8e657091098db7ead8950100')
license=("GPL3")
arch=("x86_64")
depends=(gtk2 gegl)

build() {
    cd $srcdir/$pkgname-$pkgver
    ./configure --prefix=/usr --with-gegl-0.3
    make
}

package() {
    cd $srcdir/$pkgname-$pkgver
    make DESTDIR="$pkgdir" install
}
