# Contributor: Jaroslav Lichtblau <svetlemodry@archlinux.org>

pkgname=tuxcmd
pkgver=0.6.70
pkgrel=9
pkgdesc='A GTK2 file manager with two panels'
arch=('x86_64')
url='http://tuxcmd.sourceforge.net/'
license=('GPL')
depends=('gtk2')
makedepends=('fpc')
optdepends=('tuxcmd-modules: modules for tuxcmd')
options=('!docs' '!emptydirs')
source=(https://downloads.sourceforge.net/project/$pkgname/$pkgname/$pkgname-dev-$pkgver/$pkgname-$pkgver.tar.bz2)
sha256sums=('b9f924766f2b1770f5fddc2b2e79c6778b44606ea05c53c9ffd947436b0e41fb')

build() {
  cd ${pkgname}-${pkgver}

  make
}

package() {
  cd ${pkgname}-${pkgver}

  make DESTDIR="${pkgdir}"/usr install

# remove license and README file
  rm -rf "${pkgdir}"/usr/share/doc/
}
