# Maintainer: jojo7682345 <jojo7682345@gmail.com>
pggbase=avbuilder
pkgname=avbuilder-git
pkgver=v0.1.1
pkgrel=1
pkgdesc="A flexible build system written in C"
arch=('x86_64')
url="https://github.com/jojo7682345/avBuilder.git"
license=('GPL')
makedepends=(git)
provides=(avBuilder)
source=("git+$url")
md5sums=('SKIP') 

pkgver(){
  cd "avBuilder"
  printf "v0.1.1-r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
  cd "avBuilder"
  chmod +x ./bootstrap.sh
  ./bootstrap.sh
  ./avBuilder avBuilder.project
}

package() {
  cd "avBuilder"

  ./bootstrap.sh install $pkgdir/usr/bin/avBuilder
}
