# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
pkgname=thc-hydra
pkgver=9.5
pkgrel=1
pkgdesc="A parallelized network login cracker"
arch=('any')
url="https://github.com/vanhauser-thc/thc-hydra"
license=('AGPL-3.0-or-later')
groups=()
depends=('gtk3' 'zlib' 'openssl')
makedepends=()
provides=('thc-hydra')
source=("https://github.com/vanhauser-thc/thc-hydra/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('a8fe42d175d184cdb82072f3a963b956d767fa908aaf1cbbc0746b6a67cfd37f8b5e3ecf9be82085a7f6c1ef57e91a8bf05bfeb41e96708899b6c8d7f05eee06')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}

