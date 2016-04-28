# Maintainer: Josip Ponjavic <josipponjavic at gmail dot com>
# Contributor:

pkgname=fotowall-git
pkgver=0.98.beta.r17.g7b4b595
pkgrel=2
pkgdesc="A creative tool that allows you to layout your photos or pictures in a personal way"
arch=('i686' 'x86_64')
url="https://github.com/enricoros/fotowall"
license=('GPL2')
depends=('desktop-file-utils' 'qt5-svg')
makedepends=('git')
provides=("${pkgname%-*}")
conflicts=("${pkgname%-*}")
source=("git+${url}.git")
md5sums=('SKIP')

pkgver() {
  cd "${pkgname%-*}"
  git describe --long --tags | sed -r 's/([^-]*-g)/r\1/;s/-/./g'
}

build() {
  cd "${pkgname%-*}"
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${pkgname%-*}"
  make INSTALL_ROOT="${pkgdir}/" install
}
