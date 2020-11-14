# Maintainer: Artem Klevtsov <a.a.klevtsov@gmail com>

_pkgname=freebloks-3d
pkgname=freebloks-3d-git
pkgver=1.5
pkgrel=1
pkgdesc="Clone of the Blokus board game in 3D with network support"
arch=('x86_64')
url="https://www.saschahlusiak.de/freebloks-3d/"
license=('GPL2')
depends=('libxpm' 'glu')
makedepends=('git')
source=("${_pkgname}::git+https://github.com/shlusiak/Freebloks-3D.git")
sha256sums=('SKIP')
conflicts=("${_pkgname}")
replaces=("${_pkgname}")

build() {
  cd "${srcdir}/${_pkgname}"
  autoreconf -i
  ./configure --prefix=/usr
  make
}

package() {
  cd "${srcdir}/${_pkgname}"
  make DESTDIR="${pkgdir}" install
}
