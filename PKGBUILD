# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml-git
pkgver=0.r69.ba540d3
pkgrel=4
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="http://carlh.net/software/libcxml/"
license=('GPL')
depends=('libxml++>=2.6' 'boost-libs')
makedepends=('python2' 'pkg-config' 'boost')
provides=(libcxml)
conflicts=(libcxml)
source=("libcxml-git::git+http://git.carlh.net/git/libcxml.git")
sha256sums=('SKIP')

pkgver() {
  cd libcxml-git
  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd libcxml-git
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd libcxml-git
  python2 waf install --destdir=$pkgdir
}

