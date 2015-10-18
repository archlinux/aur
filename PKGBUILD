# Maintainer: speps <speps at aur dot archlinux dot org>

pkgname=blop-lv2
pkgver=1.0.0
pkgrel=1
pkgdesc="An LV2 port of the BLOP LADSPA plugins by Mike Rawes."
arch=(i686 x86_64)
url="http://drobilla.net/software/blop-lv2/"
license=('GPL3')
depends=('lv2' 'glibc')
makedepends=('python2')
source=("http://download.drobilla.net/$pkgname-$pkgver.tar.bz2")
md5sums=('3dfd6f7366938a25a47d09d9dd863b8b')

build() {
  cd $pkgname-$pkgver
  python2 ./waf configure --prefix=/usr
  python2 ./waf
}

package() {
  cd $pkgname-$pkgver
  python2 ./waf --destdir="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
