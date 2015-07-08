# Maintainer: Ondrej Jirman <megous@megous.com>

pkgname=megatools
pkgver=1.9.95
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
md5sums=('93c7762196af8ed90920084df03210fb')

build() {
  cd "megatools-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "megatools-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
