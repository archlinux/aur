# Maintainer: jojo7682345 <jojo7682345@gmail.com>
pkgname=avBuilder-git
pkgver=v0.1.1
pkgrel=1
pkgdesc="A flexible build system written in C"
arch=(x86_64)
url="https://github.com/jojo7682345/avBuilder.git"
license=('GPL')
groups=()
depends=()
makedepends=(git)
optdepends=()
provides=(avBuilder)
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP') 

pkgver(){
  cd "avBuilder"
  printf "$pkgver.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
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