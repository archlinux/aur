# Maintainer: Dylan Whichard <dylan at whichard dot com>

pkgname=mtx-svn
_pkgname=mtx
pkgver=r200
pkgrel=1
pkgdesc="Tools used to view information about, and to control, Media Changer devices such as Tape and DVD/CD libraries."
arch=('i686' 'x86_64')
url="http://http://sourceforge.net/projects/mtx/"
license=('GPL2')
provides=('mtx')
conflicts=('mtx')
makedepends=('subversion')
source=('mtx-svn::svn+http://svn.code.sf.net/p/mtx/code/trunk')
md5sums=('SKIP')

pkgver() {
  cd "${pkgname}"
  local ver="$(svnversion)"
  printf "r%s" "${ver//[[:alpha:]]}"
}

build() {
  cd "${srcdir}/${pkgname}/mtx"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${pkgname}/mtx"
  make prefix="$pkgdir/usr" sbindir="$pkgdir/usr/bin" mandir="$pkgdir/usr/share/man" install
}

# vim:set ts=2 sw=2 et:
