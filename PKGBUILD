# Maintainer: Markus Kalb <mk@filmkreis.tu-darmstadt.de>
# Contributor: Stefan Karner <stefan.karner@student.tuwien.ac.at>
pkgname=libcxml-git
pkgver=0.r69.ba540d3
pkgrel=3
pkgdesc="A small C++ library which makes it marginally neater to parse XML using libxml++"
arch=('i686' 'x86_64')
url="http://carlh.net/software/libcxml/"
license=('GPL')
groups=
depends=('libxml++>=2.6' 'boost-libs')
makedepends=('python2' 'pkg-config' 'boost')
optdepends=()
provides=(libcxml)
conflicts=(libcxml)
replaces=()
backup=()
options=()
install=
source=("libcxml-git::git+http://git.carlh.net/git/libcxml.git")
sha256sums=('SKIP')


# git variables
_gitname='libcxml-git'

pkgver() {
  cd "$_gitname"

  printf "0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd  "$_gitname"
  python2 waf configure --prefix=/usr
  python2 waf build
}

package() {
  cd  "$_gitname"
  python2 waf install --destdir=$pkgdir
}

