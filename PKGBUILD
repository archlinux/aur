# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Your Name <youremail@domain.com>
pkgbase=afetch-git
pkgname=afetch
pkgver=1
pkgrel=1
epoch=
pkgdesc="Fast and simple system info written in C, that can be configured at compile time by editing the config.h file"
arch=("any")
url="https://github.com/13-CF/afetch"
license=('GPL')
groups=()
depends=()
makedepends=()
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
    patch "$pkgname/Makefile" -i Makefile.patch
}

build() {
	cd "$pkgname"
	make all
}

package() {
	cd "$pkgname"
	make DESTDIR="$pkgdir/" PREFIX="/usr/" install
}
