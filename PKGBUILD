# Maintainer: X0rg
# Contributor: Antoine Lubineau <antoine@lubignon.info>

pkgname=radeontop
pkgver=1.0
pkgrel=3
pkgdesc="Radeon cards monitoring utility"
arch=('i686' 'x86_64')
url="https://github.com/clbr/radeontop"
license=('GPL3')
depends=('ncurses' 'libdrm' 'libxcb')
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/clbr/radeontop/archive/v$pkgver.tar.gz")
sha256sums=('a997ea92f38a53d59db4d8e846aec4cc04cee8b79939e89d5eb9e31c57b468fc')

prepare() {
	cd "$srcdir/$pkgname-$pkgver"
	sed -i "s/sbin/bin/" Makefile
}

build() {
	cd "$srcdir/$pkgname-$pkgver"
	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"
	make DESTDIR="$pkgdir" install
}
