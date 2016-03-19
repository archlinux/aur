# Maintainer: Jakob Gahde <j5lx@fmail.co.uk>

_pkgname=emap
pkgname=${_pkgname}-svn
pkgver=84584
pkgrel=1
pkgdesc="A map manager"
arch=('i686' 'x86_64')
url="https://svn.enlightenment.org/svn/e/trunk/PROTO/${_pkgname}"
license=('LGPL2.1')
depends=('efl')
makedepends=('subversion')
source=("svn+https://svn.enlightenment.org/svn/e/trunk/PROTO/emap")
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_pkgname}"

  svnversion
}

build() {
  cd "${srcdir}/${_pkgname}"

  ./autogen.sh --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"

  make DESTDIR="${pkgdir}" install
}
