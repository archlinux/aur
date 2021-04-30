# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=icewm-extra-themes
_oldname=icewm-themes
pkgver=1.2
pkgrel=5
pkgdesc="Extra themes for IceWM (too large to include in IceWM distribution)"
arch=(any)
url="http://github.com/bbidulock/icewm-extra-themes"
license=('GPL')
provides=($_oldname)
conflicts=($_oldname)
replaces=($_oldname)
depends=(icewm)
makedepends=(markdown)
source=("https://github.com/bbidulock/icewm-extra-themes/releases/download/$pkgver/$pkgname-$pkgver.tar.lz")
md5sums=('8bb4a8bc7fbde0ac083c4f277d205642')

build() {
  cd $pkgname-$pkgver
  ./configure
  make
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
