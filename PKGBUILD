# Maintainer: Christopher Arndt <aur -at- chrisarndt -dot- de>
# Contributor: speps <speps at aur dot archlinux dot org>

pkgname=fomp
pkgver=1.0.0
pkgrel=1
pkgdesc="An LV2 port of the MCP, VCO, FIL, and WAH plugins by Fons Adriaensen"
arch=(i686 x86_64)
url="http://drobilla.net/software/$pkgname/"
license=('GPL2')
depends=('lv2')
makedepends=('python2')
source=("http://download.drobilla.net/$pkgname-$pkgver.tar.bz2")
md5sums=('0bb3d8331326d2c3485a9c538436cb56')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  python2 waf configure --prefix=/usr \
                        --mandir=/usr/share/man
  python2 waf
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  DESTDIR="$pkgdir/" python2 waf install
}
