# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=purple-plugin-pack
pkgver=2.5.1
pkgrel=1
pkgdesc="Plugin pack for Pidgin"
arch=('i686' 'x86_64')
url="http://plugins.guifications.org/trac/wiki/PluginPack"
license=('GPL')
depends=('pidgin')
makedepends=('intltool' 'python')
replaces=('gaim-plugin-pack')
options=('!libtool')
source=(http://plugins.guifications.org/trac/downloads/22)
md5sums=('c7026ed4e9fd3d1de4bed783aa1d9e00')

build() {
  cd "$srcdir/purple-plugin_pack-$pkgver"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
