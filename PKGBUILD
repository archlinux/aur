# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Frank Carlyle McLaughlin <frank@frankspace.com>

pkgname=worker
pkgver=4.11.0
pkgrel=1
pkgdesc="A file manager for the X Window System"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.boomerangsworld.de/worker"
depends=('avfs' 'gcc-libs' 'libx11' 'file' 'xorgproto')
makedepends=('libxt')
source=(http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2
        http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2.asc)
sha512sums=('17675e90d15ef323e81efedf96b53ce0aa1fe22f58f298498a9740657e297114c3f7ca8b4f24e63269a7a87c78e09b881c9cef4a6fe42f46f7457bf4187f5834'
            '11b03dbd1f339c4b07cbe45e8b128dedfc3ee9d19c17fc07db57fbb6b2d871296fe36c158aef0cf373e1bbf55c48d8048823aeff44450bef3837899cc5f886f1')
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

