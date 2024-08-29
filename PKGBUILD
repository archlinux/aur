# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Frank Carlyle McLaughlin <frank@frankspace.com>

pkgname=worker
pkgver=5.1.0
pkgrel=1
pkgdesc="A file manager for the X Window System"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.boomerangsworld.de/worker"
depends=('avfs' 'gcc-libs' 'libx11' 'file' 'xorgproto')
makedepends=('libxt')
source=(http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2
        http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2.asc)
sha512sums=('6ccfb7b97ca864a8fc34ec301c2e5d3996815a92d20d1edf857619ea3420afc34df55f5d0bbfa48c48c54fbffd2d57f9fb485a240b73ce84e4abe229c4c96584'
	    '0266439e0e88cefaa845d7cbf42d117b75f779785ec0ab4807a90e7b2f094926ddfd195d144e345c83170fb4ea4b8ee0a9f6d9a9d57e15131d9765b0cda1f240')

validpgpkeys=('F9299EE90A729029E71AF26B667132D0FBC52B37') # Ralf Hoffmann

build() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  ./configure --enable-xft --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}-${pkgver}"
  make DESTDIR="${pkgdir}" install
}

