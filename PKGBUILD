# Maintainer: Tasos Latsas < tlatsas2000 at gmail dot com >

pkgname=t4k_common
pkgver=0.1.1
pkgrel=2
pkgdesc="Common library for code shared by TuxType and TuxMath"
arch=('i686' 'x86_64')
url="http://tux4kids.alioth.debian.org/"
license=('GPL')
depends=('sdl_image' 'sdl_mixer' 'sdl_pango' 'sdl_net' 'librsvg')
makedepends=('make')
options=('!docs')
source=("http://downloads.sourceforge.net/project/tuxmath/$pkgname/${pkgname}-${pkgver}.tar.gz"
        "libpng15.patch")
sha1sums=('626eddedee86059ccab593a226c8d98571018b46'
          'aa909083dec77cf7a0e8c25ef422e05b8a84efe1')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  patch -Np2 -i "$srcdir/libpng15.patch"
}

build() {
  cd "$srcdir/$pkgname-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"

  make DESTDIR=$pkgdir install
}

# vim: ts=2 sw=2 et:
