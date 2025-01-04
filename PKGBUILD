# Maintainer: Raja Mukherji <rajamukherji@gmail.com>
pkgname=minilang-libs-standard
pkgver=1.0.0
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
provides=('minilang-libs-standard')
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
	cd "$pkgname"
	git submodule update --init --recursive
}

build() {
	cd "$pkgname"
	rabs -p$(nproc) standard
}

check() {
	cd "$pkgname"
}

package() {
	cd "$pkgname"
	rabs standard -DPREFIX="$pkgdir/usr" -DINSTALL
}
