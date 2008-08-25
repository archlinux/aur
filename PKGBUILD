# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Dale Blount <dale@archlinux.org>

pkgname=purple-plugin-pack
pkgver=2.4.0
pkgrel=1
pkgdesc="Plugin pack for Pidgin"
arch=('i686' 'x86_64')
url="http://plugins.guifications.org/trac/wiki/PluginPack"
license=('GPL')
depends=('pidgin')
makedepends=('intltool' 'python')
replaces=('gaim-plugin-pack')
options=('!libtool')
source=(http://downloads.guifications.org/plugins/Plugin%20Pack/purple-plugin_pack-$pkgver.tar.bz2)
md5sums=('ae7e133119eb7f127e22566fe9f56145')

build() {
  cd "$srcdir/purple-plugin_pack-$pkgver"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
