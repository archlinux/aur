# Maintainer: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Daniel Milde <daniel at milde dot cz>

pkgname=dibuja
pkgver=0.12.0
pkgrel=1
pkgdesc="Gtk based basic paint program like classic MS Paint or Paintbrush for Mac but for Linux"
url="https://launchpad.net/dibuja"
makedepends=('automake-1.15')
source=("https://launchpad.net/dibuja/trunk/$pkgver/+download/dibuja-$pkgver.tar.gz")
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
sha256sums=('24f2a19d6aae58b6d7b99eabf13017173fac14800ad84b6103c72076d4c9d8b3')
