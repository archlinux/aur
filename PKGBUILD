# Maintainer: Maciej Suminski <orson@orson.net.pl>

pkgname=vcdiff-git
pkgver=r26.baab8ca
pkgrel=1
pkgdesc="The ultimate VCD files comparator"
arch=('i686' 'x86_64')
url="https://github.com/orsonmmz/vcdiff.git"
license=('GPL3')
depends=('gcc-libs')
makedepends=('git')
source=("${pkgname}"'::git+https://github.com/orsonmmz/vcdiff')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list HEAD --count --first-parent)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${pkgname}"
  make
}

package() {
  cd "${srcdir}/${pkgname}"
  make DESTDIR="${pkgdir}" install
}

# vim:set ts=8 sts=2 sw=2 et:
