# Maintainer: Raja Mukherji <rajamukherji@gmail.com>
pkgname=minilang
pkgver=2.11.0
pkgrel=2
epoch=
pkgdesc="Mini programming language"
arch=('x86_64' 'i686')
url=""
license=('MIT')
groups=()
depends=()
makedepends=('rabs')
checkdepends=()
optdepends=()
provides=('minilang')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/wrapl/$pkgname#tag=v$pkgver")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

prepare() {
	cd "$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	make
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	rabs -DPREFIX="$pkgdir/usr" -DINSTALL
}
