# Maintainer: Martin C. <martincation@protonmail.com>

pkgname=xfce4-memgraph-plugin
pkgver=1.2.3
pkgrel=1
pkgdesc="Graphical representation of the MEM load"
arch=('x86_64')
license=('GPL' 'custom')
depends=('xfce4-panel')
makedepends=('intltool')
source=(git+https://github.com/Cationiz3r/xfce4-memgraph-plugin)
md5sums=('SKIP')

build() {
  cd "$pkgname"

  ./configure \
    --prefix=/usr \
    --sysconfdir=/etc \
    --libexecdir=/usr/lib \
    --localstatedir=/var \
    --disable-static \
    --disable-debug
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
  install -Dm644 COPYING "$pkgdir/usr/share/licenses/$pkgname/COPYING"
}
