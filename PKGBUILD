# Maintainer: Albert Graef <aggraef at gmail dot com>
# Debian Upstream Maintainer: IOhannes m zmölnig <umlaeute at debian.org>

pkgname=pd-lua
pkgver=0.9
pkgrel=1
pkgdesc="Lua bindings for Pd"
arch=("i686" "x86_64")
license=('GPL')
url="https://github.com/agraef/pd-lua"
depends=('pd' 'lua')
makedepends=('pkg-config')
source=("$pkgname-$pkgver.tar.gz::https://github.com/agraef/$pkgname/archive/$pkgver.tar.gz")
md5sums=('48c8a172614ad9dacc1d538e28994852')

build() {
     cd $srcdir/$pkgname-$pkgver
     make LUA_CFLAGS="$(pkg-config --cflags lua pd)" LUA_LIBS="$(pkg-config --libs lua pd)"
}

package() {
     cd $srcdir/$pkgname-$pkgver
     make DESTDIR="$pkgdir" prefix=/usr install
}
