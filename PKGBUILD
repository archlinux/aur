# Maintainer: Jose Riha <jose1711 gmail com>

pkgname=whack-a-mole-git
pkgver=r9.a0d161a
pkgrel=1
pkgdesc="ncurses implementation of the classic electromechanical arcade game"
url="https://github.com/PaulWWeaver/Whack-A-Mole"
depends=('ncurses')
makedepends=('git')
conflicts=(whack-a-mole)
license=('MIT')
arch=('x86_64' 'i686')
source=("${pkgname}"::'git+https://github.com/PaulWWeaver/Whack-A-Mole.git')
md5sums=('SKIP')

pkgver() {
  cd "${srcdir}/${pkgname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd ${srcdir}/${pkgname}
  make
}


package() {
  install -Dm755 "${srcdir}/${pkgname}/Whack-A-Mole" "${pkgdir}/usr/bin/Whack-A-Mole"
}

# vim:set ts=2 sw=2 et:
