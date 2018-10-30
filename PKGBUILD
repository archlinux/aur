#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=funyahoo-plusplus-git
_pkgname=funyahoo-plusplus
pkgver=r79.fbbd9c5
pkgrel=1
pkgdesc="Replacement Yahoo prpl (protocol plugin) for Pidgin/libpurple"
arch=("i686" "x86_64")
url="https://github.com/EionRobb/funyahoo-plusplus"
license=("GPL3")
depends=("libpurple" "json-glib")
conflict=()
source=("git+https://github.com/EionRobb/funyahoo-plusplus.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  make || return 1
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}/" install
}

#
# EOF
#
