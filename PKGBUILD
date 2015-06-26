# Maintainer: Dmitry Barker Medvedev <barkdarker@gmail.com>
pkgname=sdvt-git
_gitname=sdvt
pkgver=0.9.2.gc83c
pkgrel=2
pkgdesc='simple desktop virtual terminal'
arch=('i686' 'x86_64')
url='https://github.com/darkbarker/sdvt'
license=('GPL')
depends=('vte290')
makedepends=('git')
source=('git+https://github.com/darkbarker/sdvt.git')
md5sums=('SKIP')

pkgver() {
  cd $_gitname
  # Use the tag of the last commit
  #git describe --always | sed 's|-|.|g'
  git describe --abbrev=4 --dirty --always | sed 's|-|.|g'
}

build() {
  cd $_gitname
  make
}

package() {
  cd $_gitname
  make PREFIX=/usr DESTDIR="$pkgdir" install
}
