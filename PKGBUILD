# Maintainer: Aaron Fischer <mail@aaron-fischer.net>
# Contributor: J. W. Birdsong <jwbirdsong AT gmail DOT com>
# Contributor: Kevin Piche <kevin@archlinux.org>
# Contributor: Frank Carlyle McLaughlin <frank@frankspace.com>

pkgname=worker
pkgver=4.7.0
pkgrel=2
pkgdesc="A file manager for the X Window System"
arch=('i686' 'x86_64')
license=('GPL')
url="http://www.boomerangsworld.de/worker"
depends=('avfs' 'gcc-libs' 'libx11' 'file' 'xorgproto')
makedepends=('libxt')
source=(http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2
        http://www.boomerangsworld.de/cms/${pkgname}/downloads/${pkgname}-${pkgver}.tar.bz2.asc)
sha512sums=('d7a9e01e138afc8b56cac552e3cc5e07ab5c2e29100a1a75098cd6413e322797366abfbae6aba86bcec297b6f1d06608b3ecb5d87dec784f3b5c2216f512accd'
            'a5cd92aa47cac7c68275c76ecebcb18c3585c6fb2df525a473d74768d9c77ef5d54d121044f401b68516b1116b2fcbe41fe0520809092c954b5ea6ba092cebee')

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
