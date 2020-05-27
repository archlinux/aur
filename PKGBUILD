# Maintainer: Your Name <youremail@domain.com>
pkgname=mpv-quack
pkgver=r4.1c87f36
pkgrel=1
epoch=
pkgdesc="mpv script for temporarily reducing audio volume after seeking"
arch=('any')
url="https://github.com/CounterPillow/mpv-quack"
license=('GPL3')
groups=()
depends=('mpv')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=quack.install
changelog=
source=("git+https://github.com/CounterPillow/mpv-quack")
noextract=()
md5sums=('SKIP')
validpgpkeys=()


pkgver() {
  cd "$pkgname"
  ( set -o pipefail
    git describe --long 2>/dev/null | sed 's/\([^-]*-g\)/r\1/;s/-/./g' ||
    printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
  )
}


prepare() {
	cd "$pkgname"
}

build() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
  install -D -m644 quack.lua "${pkgdir}/usr/share/mpv/scripts/quack.lua" 
}
