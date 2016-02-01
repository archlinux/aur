# This is an example PKGBUILD file. Use this as a start to creating your own,
# and remove these comments. For more information, see 'man PKGBUILD'.
# NOTE: Please fill out the license field for your package! If it is unknown,
# then please put 'unknown'.

# Maintainer: Liam Greenough <beacon515@gmail.com>
pkgname=fallout-terminal-clone-git
_pkgbase=fallout-terminal-clone
pkgver=VERSION
pkgrel=1
epoch=
pkgdesc="Simple clone for Fallout 3/NV terminal hacking in curses"
arch=('i686' 'x86_64')
url="https://github.com/Josh1147582/fallout-terminal-clone#branch=master"
license=('MIT')
groups=()
depends=('ncurses')
makedepends=('gcc' 'git')
checkdepends=()
optdepends=('cool-retro-term: improved immersion')
provides=('fallout-terminal-clone')
conflicts=('fallout-terminal-clone')
replaces=()
backup=()
options=()
install=
changelog=
source=('fallout-terminal-clone::git+https://github.com/Josh1147582/fallout-terminal-clone.git')
noextract=()
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$srcdir"/"$_pkgbase"/src
	gcc FalloutTerminal.c -lncurses -o FalloutTerminal
}

package() {
	cd "$srcdir"/"$_pkgbase"/src
	chmod +x FalloutTerminal
	mkdir "$pkgdir"/usr
	mkdir "$pkgdir"/usr/bin
	cp FalloutTerminal "$pkgdir"/usr/bin
}
pkgver(){
	cd "$srcdir"/"$_pkgbase"
  	git describe --long | sed 's/\([^-]*-g\)/r\1/;s/-/./g'
}
