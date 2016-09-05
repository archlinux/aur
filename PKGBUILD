# Maintainer: Marco Melletti <melletti.marco@gmail.com>
pkgname=uarm-git
pkgver=v0.5.3.r52.8b10fc0
pkgrel=7
pkgdesc="arm7tdmi based computer emulator with debugging tools"
arch=('any')
url="http://mellotanica.github.io/uARM/"
license=('GPL')
conflicts=('uarm')
depends=('qt5-declarative' 'gcc' 'make' 'boost')
optdepends=('python2: for uarm-readuarm header reader' 'arm-none-eabi-gcc: cross compiler for target architecture')
makedepends=('git')
backup=('etc/default/uarm')
install=
source=('git+https://github.com/mellotanica/uARM.git#branch=master')
md5sums=('SKIP')

_gitdir='uARM'

pkgver() {
	cd "$_gitdir"
	printf "%s" "$(git describe --long | sed 's/\([^-]*-\)g/r\1/;s/-/./g')"
}

build() {
	cd "$_gitdir"

	./compile
}

package() {
	cd "$_gitdir"
	./install.sh -b "$pkgdir"
}
