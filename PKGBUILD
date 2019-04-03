# Maintainer: Eric Bélanger <eric@archlinux.org>

pkgname=epplet-base
pkgver=0.14
pkgrel=3
pkgdesc="Addon plugins for the enlightenment windowmanager"
arch=('x86_64')
url="http://www.enlightenment.org"
license=('GPL')
depends=('imlib2' 'libcdaudio' 'libgl')
makedepends=('mesa')
source=(http://downloads.sourceforge.net/sourceforge/enlightenment/epplets-${pkgver}.tar.gz)
sha512sums=('d83d60521fe06497f109c3fbb5c2e10abd36a43b050c10787a68d9f9f8c2866f57d78a8559a482654d9bb0eaaf3ce791e4839bb0fda88ccbf026d8ec5dc93824')

build() {
  cd epplets-${pkgver}
  ./configure --prefix=/usr
  make
}

package() {
  cd epplets-${pkgver}
  make DESTDIR="${pkgdir}" install
}
