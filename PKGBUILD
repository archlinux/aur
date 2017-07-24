# Maintainer : speps <speps at aur dot archlinux dot org>
# Contributor: Andrew LeCain dread@csh.rit.edu

pkgname=screen-message
pkgver=0.25
pkgrel=1
pkgdesc="Displays a short text fullscreen as large and as quickly as possible."
arch=('i686' 'x86_64')
url="http://www.joachim-breitner.de/projects"
license=('GPL')
depends=('gtk3')
source=("http://www.joachim-breitner.de/archive/$pkgname/$pkgname-$pkgver.tar.gz")
sha256sums=('60291a493a6e30714c8704c614b37ef94621a917c3a9fa290800df82712989d3')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  # install to /usr/bin
  sed -i "s|/games|/bin|g" Makefile.*

  ./configure --prefix=/usr
  make
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  make DESTDIR="$pkgdir/" install
}
