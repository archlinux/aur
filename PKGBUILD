# Maintainer: Kamil Cukrowski <kamilcukrowski@gmail.com>

pkgname=libdfp
pkgver=1.0.16
pkgrel=1
pkgdesc="Decimal Floating Point C Library"
arch=(i686 x86_64)
url="https://github.com/libdfp/libdfp"
license=('GPL')
groups=()
depends=('gcc-libs')
makedepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
source=("https://github.com/libdfp/libdfp/releases/download/${pkgver}/libdfp-${pkgver}.tar.gz")
sha256sums=('eed54dcc9e13136fbe120bbbc2efce1f2e0f407311016c21f5c521dc302d846d')

build() {
	cd "./libdfp-${pkgver}"
	./bootstrap
	./configure --prefix=/usr
	make
}

check() {
	cd "./libdfp-${pkgver}"
	make check
}

package() {
	cd "./libdfp-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
