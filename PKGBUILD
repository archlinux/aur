# Maintainer : Ionut Biru <ibiru@archlinux.org>
# Contributor: Alexander Fehr <pizzapunk gmail com>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=purple-plugin-pack
pkgver=2.6.3
pkgrel=1
pkgdesc="Plugin pack for Pidgin"
arch=('i686' 'x86_64')
url="http://plugins.guifications.org/trac/wiki/PluginPack"
license=('GPL')
depends=('pidgin')
makedepends=('intltool' 'python')
options=('!libtool')
source=(http://plugins.guifications.org/trac/downloads/48)
md5sums=('2dccee28f087c7e81cef07ee845399bb')

build() {
  cd "$srcdir/purple-plugin_pack-$pkgver"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
