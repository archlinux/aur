# Maintainer: Brian Bidulock <bidulock@openss7.org>
#
pkgname=xtoolwait-git
pkgver=1.3.6.1.15.gf678a38
pkgrel=1
pkgdesc="Utility similar to 'toolwait' on the Sun platform"
epoch=1
arch=(i686 x86_64)
url="https://github.com/dlitz/xtoolwait"
license=('GPL')
depends=('libxext')
makedepends=('git' 'imake')
source=("$pkgname::git+https://github.com/dlitz/xtoolwait.git")
md5sums=('SKIP')

pkgver() {
  cd $pkgname
  git describe --tags |sed 's,^v,,;s,-,.,g'
}

build() {
  cd $pkgname
  xmkmf
  make
}

package() {
  cd $pkgname
  make DESTDIR="$pkgdir/" install
  make DESTDIR="$pkgdir/" install.man
}

# vim:set ts=2 sw=2 et:
