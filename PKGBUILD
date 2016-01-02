# Maintainer: Ondrej Jirman <megous@megous.com>

pkgname=megatools
pkgver=1.9.96
pkgrel=1
pkgdesc="Command line client application for Mega.co.nz"
arch=('i686' 'x86_64')
url="http://megatools.megous.com"
license=('GPL')
depends=('curl' 'glib-networking' 'fuse')
makedepends=('gobject-introspection')
optdepends=('gobject-introspection: Bindings support for JavaScript')
source=("http://megatools.megous.com/builds/megatools-${pkgver}.tar.gz")
options=(!libtool)
md5sums=('6407d65fb526715672a1912c23b17607')

build() {
  cd "megatools-${pkgver}"

  autoreconf -fi
  ./configure --prefix=/usr

  make
}

package() {
  cd "megatools-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
