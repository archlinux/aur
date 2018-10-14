# Maintainer: nosada <ngsksdt@gmail.com>

pkgname=kytea-git
_pkgname=kytea
pkgver="r143.ae3d235"
pkgrel=1
pkgdesc="The Kyoto Text Analysis Toolkit for word segmentation and pronunciation estimation, etc."
url="http://www.phontron.com/kytea"
arch=('any')
license=('APACHE')
depends=('git')
source=('git+https://github.com/neubig/kytea.git')
sha1sums=('SKIP')

pkgver() {
  cd "${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${_pkgname}

  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd ${srcdir}/${_pkgname}
  make install DESTDIR="${pkgdir}"
}

# vim:set ts=2 sw=2 et:
