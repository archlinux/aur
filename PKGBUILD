# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmbubble
pkgver=1.49rc2.r13.gcd98c65
pkgrel=1
pkgdesc="Official maintained fork of timecop's bubblemon-dockapp"
arch=('i686' 'x86_64')
url="http://github.com/rnjacobs/wmbubble"
license=('GPL')
depends=('libx11')
makedepends=('git')
source=("$pkgname::git+https://github.com/rnjacobs/wmbubble.git#branch=debian")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags --long|sed -r 's,-([^-]*),.r\1,;s,-,.,g'
}

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  make PREFIX=/usr DESTDIR="$pkgdir" install
  mkdir -p "$pkgdir/usr/share/doc/$pkgname/"
  install -c README "$pkgdir/usr/share/doc/$pkgname/README"
}

# vim: set sw=2 et:
