# Maintainer: Fronkles McFranko <mrelfranko@disroot.org>
pkgname=afetch-git
_pkgname=afetch
pkgver=1
pkgrel=1
epoch=
pkgdesc="Fast and simple system info written in C, that can be configured at compile time by editing the config.h file"
arch=("any")
url="https://github.com/13-CF/afetch"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'gcc' 'make')
checkdepends=()
optdepends=()
provides=(afetch)
conflicts=(afetch)
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/13-CF/afetch"
    "Makefile.patch")
noextract=()
md5sums=("SKIP" "SKIP")

prepare() {
    patch "$_pkgname/Makefile" -i Makefile.patch
}

build() {
	cd "$_pkgname"
	make all
}

package() {
	cd "$_pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr/" install
}
