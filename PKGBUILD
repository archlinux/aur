# Maintainer: Brian Bidulock <bidulock@openss7.org>
# Contributor: Daniel Isenmann <daniel@archlinux.org>
# Contributor: orelien <orelien@chez.com>

pkgname=windowmaker-extra
pkgver=0.1
pkgrel=6
pkgdesc="Extra WindowMaker icons and themes"
arch=('any')
url="http://www.windowmaker.info"
license=('GPL2')
depends=('windowmaker')
source=(https://sources.archlinux.org/other/packages/windowmaker-extra/windowmaker-extra-$pkgver.tar.gz)
md5sums=('3ef850cfe0fb6660a55ccc8a2e408f74')

build() {
  cd "$srcdir/WindowMaker-extra-$pkgver"
  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/WindowMaker-extra-$pkgver"
  make DESTDIR="$pkgdir" install
  rm -f "$pkgdir/usr/share/WindowMaker/Icons/xv.xpm"
}
# vim: ts=2 sw=2 et ft=sh
