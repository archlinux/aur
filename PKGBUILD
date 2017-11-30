#
# Maintainer: Uffe Jakobsen <uffe@uffe.org>
#

pkgname=qtl866-git
_pkgname=qtl866
pkgver=r53.1173c3e
pkgrel=1
pkgdesc="minipro GUI for TL866 programmer"
arch=("i686" "x86_64")
url="https://github.com/wd5gnr/qtl866"
license=("GPL3")
build=("qmake")
depends=("qt5-base")
conflict=("qtl866")
source=("git+https://github.com/wd5gnr/qtl866.git")
md5sums=('SKIP')


pkgver() {
  cd "${srcdir}/${_pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${srcdir}/${_pkgname}"
  qmake
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make INSTALL_ROOT="${pkgdir}/" install_target
}

#
# EOF
#
