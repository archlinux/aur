# Contributor: Jashank Jeremy <arch-aur at jashankj dot space>
# Maintainer: Tavian Barnes <tavianator@tavianator.com>

pkgname=libxo
pkgver=1.7.5
pkgrel=1
pkgdesc='A library for generating text, XML, JSON, and HTML output'
arch=('x86_64')
url='https://github.com/juniper/libxo'
license=('BSD')
groups=()
depends=()
makedepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
source=("https://github.com/juniper/$pkgname/releases/download/$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('d12249ffad3ef04b160e6419adf1bbe7e593a60bb23f0a0a077fa780b214934a')
noextract=()

build() {
	cd "${pkgname}-${pkgver}"
	sh ./bin/setup.sh
	sh ./configure --prefix=/usr
	make
}

check() {
	cd "${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${pkgname}-${pkgver}"
	make install DESTDIR="$pkgdir/"
}
