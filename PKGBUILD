# Maintainer: James Rayner <james@archlinux.org>
# Maintainer: Alexander Fehr <pizzapunk gmail com>
# Contributor: Sebastian Sareyko <public@nooms.de>

pkgname=nitrogen
pkgver=1.5.1
pkgrel=1
pkgdesc="Background browser and setter for X windows"
arch=('i686' 'x86_64')
url="http://projects.l3ib.org/nitrogen/"
license=('GPL')
depends=('gtkmm' 'hicolor-icon-theme' 'librsvg>=2.26')
install=nitrogen.install
source=(http://projects.l3ib.org/nitrogen/files/nitrogen-$pkgver.tar.gz)
md5sums=('e683d7c10c17bd18eb9fd78c87c4e08c')

build() {
  cd "$srcdir/$pkgname-$pkgver"

  ./configure --prefix=/usr || return 1
  make || return 1
  make DESTDIR="$pkgdir" install || return 1
}
