# Maintainer: Raja Mukherji <rajamukherji@gmail.com>
pkgname=minilang-libs-postgres
pkgver=1.0.11
pkgrel=1
epoch=
pkgdesc="Mini programming language"
arch=('x86_64' 'i686')
url="https://minilang-libs.readthedocs.io"
license=('MIT')
groups=()
depends=('minilang')
makedepends=('rabs' 'minilang')
checkdepends=()
optdepends=()
provides=('minilang-libs-postgres')
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("git+https://github.com/wrapl/minilang-libs#tag=v$pkgver")
noextract=()
md5sums=(SKIP)
validpgpkeys=()

prepare() {
	cd minilang-libs
	git submodule update --init --recursive
}

build() {
	cd minilang-libs
	rabs -p$(nproc) postgres
}

check() {
	cd minilang-libs
}

package() {
	cd minilang-libs
	rabs postgres -DPREFIX="$pkgdir/usr" -DINSTALL
}
