# Manteiner: Pekman <pekman@openmailbox.org>
# Contributor: Ivy Foster <joyfulgirl (at) archlinux.us>
# Contributor: Giorgio Lando <patroclo7@gmail.com>

pkgname=flpsed
pkgver=0.7.3
pkgrel=1
pkgdesc="A WYSIWYG PostScript annotator"
url="http://flpsed.org/flpsed.html"
license=(GPL)
changelog=ChangeLog
depends=('ghostscript' 'fltk')
arch=('i686' 'x86_64')
source=(http://flpsed.org/${pkgname}-${pkgver}.tar.gz)
sha256sums=('b70bb751bd70af9893ae2369f0789fd79729d0d6d1fee6e0522c4e6f55c7cf6e')

build() {
  cd ${srcdir}/${pkgname}-${pkgver}
  ./configure --prefix=/usr --mandir=/usr/share/man
  make
}

package() {
  cd ${srcdir}/${pkgname}-${pkgver}
  make DESTDIR=$pkgdir install
}

# End of file
