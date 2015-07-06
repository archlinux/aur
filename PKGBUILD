# Maintainer: Maxim Andersson <thesilentboatman@gmail.com>
# Contributor: Antti Hautaniemi <an7oine at me com>

pkgname=atomicparsley-largefile-hg
_hgname=atomicparsley
pkgver=r110.3c31f225a823
pkgrel=1
pkgdesc="Program for iTunes-style metadata manipulation with >4GB MPEG4 files"
arch=('i686' 'x86_64')
url="https://bitbucket.org/wez/atomicparsley/"
license=('GPL')
makedepends=('mercurial' 'zlib')
provides=('atomicparsley')
conflicts=('atomicparsley')
source=('hg+https://bitbucket.org/wez/atomicparsley')
sha256sums=('SKIP')

pkgver() {
  cd "${srcdir}/${_hgname}"
  printf "r%s.%s" "$(hg identify -n)" "$(hg identify -i)"
}

build() {
  cd "${srcdir}/${_hgname}"

  ./autogen.sh
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_hgname}"

  make DESTDIR="${pkgdir}" install
}

# vim:set ts=2 sw=2 et:
