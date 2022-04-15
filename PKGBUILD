# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Iris Nkrichronos <ir1s_S@outlook.com>
pkgname=treedude-git
pkgver=1.0.r10.319ee92
pkgrel=1
epoch=
pkgdesc="The TreeDude minigame from SUPERHOT"
arch=(x86_64)
url="https://github.com/nkrichronos/TreeDude/"
license=('GPL3')
groups=()
depends=(ncurses)
makedepends=(git gcc ncurses)
checkdepends=()
optdepends=()
provides=(treedude)
conflicts=(treedude)
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
	cd TreeDude
	printf "1.0.r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)" 
}

build() {
	cd TreeDude
	gcc main.c -lncurses -o tree
}


package() {
	cd TreeDude
	mkdir -p ${pkgdir}/opt/${pkgname}
	cp -rf * ${pkgdir}/opt/${pkgname}
	install -Dm 755 tree "$pkgdir"/usr/bin/treedude
	
}
