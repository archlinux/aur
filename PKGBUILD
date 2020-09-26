# Maintainer: Rohit Goswami (HaoZeke) <rohit.goswami@aol.com>
pkgname=iboview
_realname=ibo-view
pkgver="20150427"
pkgrel=1
pkgdesc="A program for analyzing molecular electronic structure, based on Intrinsic Atomic Orbitals (IAOs)."
arch=('x86_64')
url="http://www.iboview.org/bin/"
license=('GPL')
depends=('qt5-base' 'openblas' 'boost' 'intel-mkl')
provides=('iboview')
options=('!strip' '!emptydirs')
source=("${_realname}-${pkgver}.tar.bz2::$url/${_realname}.${pkgver}.tar.bz2")
md5sums=('37f0aff8e1c0bc5f23a4b80b5df54f8d')
# use updpkgsums

build() {
  cd "${_realname}.$pkgver"
  make distclean
  qmake main.pro
  make
}

package() {
  cd "${_realname}.$pkgver"
  install -Dm 755 iboview "$pkgdir"/usr/bin/iboview
}

# vim:set ts=2 sw=2 et:
