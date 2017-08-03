# Maintainer: Brian Bidulock <bidulock@openss7.org>

pkgname=icewm-extra-themes
_oldname=icewm-themes
pkgver=1.0
pkgrel=1
pkgdesc="Extra themes for IceWM (too large to include in IceWM distribution)"
arch=(any)
url="http://github.com/bbidulock/icewm-extra-themes"
license=('GPL')
provides=($_oldname)
conflicts=($_oldname)
replaces=($_oldname)
depends=('icewm2')
makedepends=(markdown)
source=("https://github.com/bbidulock/icewm-extra-themes/releases/download/$pkgver/$pkgname-$pkgver.tar.xz")
md5sums=('e0f0d745f2f9b528c27423f7e3805984')

build() {
  cd $pkgname-$pkgver
  ./configure --prefix=/usr --sysconfdir=/etc
  make V=0
}

package() {
  cd $pkgname-$pkgver
  make DESTDIR="$pkgdir" install
}

# vim:set ts=2 sw=2 et:
