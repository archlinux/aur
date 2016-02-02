# Maintainer: Ondrej Jirman <megous@megous.com>

pkgname=megatools
pkgver=1.9.97
pkgrel=1
pkgdesc="Command line client application for Mega.nz"
arch=('i686' 'x86_64' 'armv7h')
url="http://megatools.megous.com"
license=('GPL')
depends=('curl' 'glib-networking' 'fuse')
makedepends=('gobject-introspection')
optdepends=('gobject-introspection: Bindings support for JavaScript')
source=("http://megatools.megous.com/builds/megatools-${pkgver}.tar.gz")
options=(!libtool)
md5sums=('03523f83e76943b7c03c8b91655e8de3')

build() {
  cd "megatools-${pkgver}"

  ./configure --prefix=/usr

  make
}

package() {
  cd "megatools-${pkgver}"

  make install DESTDIR="${pkgdir}"
}
