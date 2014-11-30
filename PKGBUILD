# Maintainer: Jaroslav Lichtblau <dragonlord@aur.archlinux.org>
# Contributor: Marc Poiroud <marci1 AT archlinux.fr>

pkgname=groff-utf8
pkgver=1
pkgrel=1
pkgdesc="An extension of groff that permits to view UTF-8 encoded man pages"
arch=('i686' 'x86_64')
url="http://www.haible.de/bruno/packages-groff-utf8.html"
license=('GPL')
depends=('groff')
makedepends=('patch')
source=(http://www.haible.de/bruno/gnu/$pkgname.tar.gz
        $pkgname-Makefile.patch)
md5sums=('acbf66fcf1df906e42c1b42f3e7d20dc'
         '68d794e84ca95642560d6f7daa3c3894')

prepare() {
  cd "${srcdir}"/$pkgname
  patch -Np0 -i "${srcdir}"/$pkgname-Makefile.patch
}

build() {
  cd "${srcdir}"/$pkgname
  make
}

package() {
  cd "${srcdir}"/$pkgname
  make PREFIX=/usr DESTDIR="${pkgdir}" install
}