# Maintainer: Daniel R. Güell <daniel@drguell.es>
pkgname=masskulator
pkgver=v0.1.12
pkgrel=1
epoch=
pkgdesc="A simple application to plot a chart with weight evolution."
arch=(x86_64)
url="https://www.drguell.es"
license=('GPL')
groups=()
depends=(qt5-charts qt5-tools)
makedepends=(qt5-base)
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("$pkgname::git+https://gitlab.com/drguell/$pkgname.git#tag=$pkgver")
sha256sums=('SKIP')
validpgpkeys=()

prepare() {
        cd "$pkgname"
}

build() {
        cd "$pkgname"
        qmake .
        make
}

check() {
        cd "$pkgname"
}

package() {
        cd "$pkgname"
	sudo make DESTDIR=$pkgdir/ install
}
