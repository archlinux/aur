# Maintainer: Matthew Sexton <matthew@asylumtech.com>
# Contributor: Frederic Bezies <fredbezies at gmail dot com>
# Contributor: Daniel Milde <daniel at milde dot cz>

pkgname=dibuja
pkgver=0.24.0
pkgrel=1
pkgdesc="Gtk based basic paint program like classic MS Paint or Paintbrush for Mac, for Linux"
arch=("x86_64")
url="https://launchpad.net/dibuja"
license=("GPL3")
depends=('gtk2' 'gegl' 'babl' 'libgexiv2')
makedepends=('automake')
source=("$url/trunk/$pkgver/+download/$pkgname-$pkgver.tar.gz")
sha256sums=('a9c98b386667287e330c8b8572001ffbf1be10a639adc05ec7b67bbdffc4731b')

build() {
    cd "$pkgname-$pkgver"
    autoconf
    ./configure --prefix=/usr --libdir=/usr/lib 
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
