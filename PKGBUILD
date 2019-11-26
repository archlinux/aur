# Maintainer: William Sutton <will at sutton-family dot org>

pkgname=mtx-git
_pkgname=MTX
pkgver=20191126
pkgrel=1
pkgdesc="Tools used to view information about, and to control, Media Changer devices such as Tape and DVD/CD libraries."
arch=('i686' 'x86_64')
url="https://github.com/zombielinux/MTX"
license=('GPL2')
provides=('mtx')
conflicts=('mtx')
makedepends=('git')
source=(git+https://github.com/zombielinux/MTX.git)
md5sums=('SKIP')

#pkgver() {
#  cd "${pkgname}"
#  local ver="$(svnversion)"
#  printf "r%s" "${ver//[[:alpha:]]}"
#}

build() {
  cd "${srcdir}/${_pkgname}/mtx"
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}/mtx"
  make prefix="$pkgdir/usr" sbindir="$pkgdir/usr/bin" mandir="$pkgdir/usr/share/man" install
}

