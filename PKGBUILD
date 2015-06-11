# Maintainer: Brian Bidulock <bidulock@openss7.org>
pkgname=wmbluegpu
pkgver=9
pkgrel=1
pkgdesc="A GPU temperature monitoring dockapp (for WindowMaker, OpenBOx, AfterStep etc)"
arch=('i686' 'x86_64')
url="http://github.com/vampirefrog/wmbluegpu"
license=('GPL')
depends=('libxpm' 'libxft')
makedepends=('git')
source=("$pkgname::git+https://github.com/vampirefrog/wmbluegpu.git")
md5sums=('SKIP')

build() {
  cd $pkgname
  make
}

package() {
  cd $pkgname
  install -Dm0755 wmbluegpu "$pkgdir/usr/bin/wmbluegpu"
  install -Dm0644 wmbluegpu.1 "$pkgdir/usr/share/man/man1/wmbluegpu.1"
}

# vim: set sw=2 et:
