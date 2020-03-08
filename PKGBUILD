# Maintainer: NimmDir5 <nimmdirfuenf@gmail.com>
pkgname=pipeline
pkgver=1.5
pkgrel=1
epoch=
pkgdesc="A utility to make building up a pipeline of shell commands easier, especially when doing data exploration."
arch=("x86_64")
url="https://github.com/codekitchen/pipeline"
license=('MIT')
groups=()
depends=()
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/codekitchen/pipeline/archive/v${pkgver}.tar.gz")
noextract=()
validpgpkeys=()

prepare() {
	cd "$pkgname-$pkgver"	
}

build() {
	cd "$pkgname-$pkgver"
	autoreconf -fi
	./configure --prefix=/usr
	make
}

check() {
	cd "$pkgname-$pkgver"
	make -k check
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
md5sums=('30591873fb101b940f5058390388b1df')
