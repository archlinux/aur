# Maintainer: Maxime Gauduin <alucryd@archlinux.org>
# Contributor: royrocks <royrocks13@gmail.com>

pkgname=cups-bjnp
pkgver=2.0
pkgrel=1
pkgdesc='CUPS back-end for the canon printers using the proprietary USB over IP BJNP protocol'
arch=('i686' 'x86_64')
url='http://sourceforge.net/projects/cups-bjnp/'
license=('GPL')
depends=('libcups')
makedepends=('cups')
source=("http://downloads.sourceforge.net/sourceforge/cups-bjnp/cups-bjnp-${pkgver}.tar.gz")
sha256sums=('2acb716680d66f1378cf8dcd45fedf7f72ccc9b66fa80214d6dcb042b5e3c9ab')

build() {
  cd cups-bjnp-${pkgver}

  ./configure --prefix='/usr'
  make
}

package() {
  cd cups-bjnp-${pkgver}

  make DESTDIR="${pkgdir}" install
}

# vim: ts=2 sw=2 et:
