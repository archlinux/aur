# Maintainer: X0rg
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=radeontop-git
pkgver=v0.6.4.g244c88e
pkgrel=2
pkgdesc='Radeon cards monitoring utility'
arch=('i686' 'x86_64')
url='https://github.com/clbr/radeontop'
license=('GPL3')
depends=('ncurses' 'xf86-video-ati')
makedepends=('git')
provides=('radeontop')
conflicts=('radeontop')
source=('git://github.com/clbr/radeontop.git')
sha256sums=('SKIP')

pkgver() {
  cd "$srcdir/${pkgname%-git}"
  git describe --always | sed 's|-|.|g'
}

prepare() {
  cd "$srcdir/${pkgname%-git}"
  sed -i "s/sbin/bin/" Makefile
}

build() {
  cd "$srcdir/${pkgname%-git}"
  make
}

package() {
  cd "$srcdir/${pkgname%-git}"
  make DESTDIR="$pkgdir/" install
}

# vim:set ts=2 sw=2 et:
