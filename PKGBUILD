# Maintainer: James Rayner <james@archlinux.org>
# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=nitrogen
pkgver=1.5
pkgrel=1
pkgdesc="Background browser and setter for X windows"
arch=('i686' 'x86_64')
url="http://projects.l3ib.org/nitrogen/"
license=('GPL')
depends=('gtkmm' 'hicolor-icon-theme' 'librsvg>=2.26.0-2')
install=nitrogen.install
source=(http://projects.l3ib.org/nitrogen/files/nitrogen-$pkgver.tar.gz)
md5sums=('a62543bb22bbc68ef5b0011471597a63')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
