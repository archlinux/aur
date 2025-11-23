# Maintainer: Raja Mukherji <rajamukherji@gmail.com>
pkgname=minilang
pkgver=2.16.0
pkgrel=1
epoch=
pkgdesc="Mini programming language"
arch=('x86_64' 'i686')
url="https://minilang.readthedocs.io"
license=('MIT')
groups=()
depends=()
makedepends=('rabs' 're2c')
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
	rabs -p$(nproc)
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	rabs -DPREFIX="$pkgdir/usr" -DINSTALL
}
