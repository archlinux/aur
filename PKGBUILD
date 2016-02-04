# Contributor: core <angrycore@gmail.com>
# Maintainer Evgeniy "arcanis" Alekseev <esalexeev@gmail.com>

pkgname=qmmp-qsmmp-git
_gitname=qsmmp
pkgver=r116.771e806
pkgrel=1
pkgdesc="Amarok-like interface for qmmp. Git version"
arch=('i686' 'x86_64')
url="https://github.com/ksv1986/qsmmp"
license=('GPL2')
depends=('qmmp')
makedepends=('git')
source=(${_gitname}::git+https://github.com/ksv1986/qsmmp.git)
md5sums=('SKIP')

pkgver() {
  cd "${_gitname}"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "${_gitname}"
  qmake-qt5 PREFIX=/usr
  make
}

package() {
  cd "${_gitname}"
  make INSTALL_ROOT="${pkgdir}" install
}
