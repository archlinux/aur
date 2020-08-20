# Maintainer: Breno Martins da costa corrêa e Souza <breno.ec@gmail.com>
pkgname=jet-git
pkgver=1.1
pkgrel=1
epoch=
pkgdesc="Persist or retrieve strings over streams."
arch=(x86_64 i686)
url="https://github.com/cognocoder/jet.git"
license=('MIT')
groups=()
depends=()
makedepends=(git gcc make)
checkdepends=()
optdepends=()
provides=(jet)
conflicts=(jet)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+$url")
noextract=()
md5sums=('SKIP')
validpgpkeys=()

pkgver() {
	cd "${_pkgname}"
  printf "1.1.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
	cd jet
	make build
}

package() {
	cd jet
	sudo make install
}
