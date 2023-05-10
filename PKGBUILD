# Maintainer: Romain Chardiny <romain.chardiny@gmail.com>
pkgname=thc-hydra
pkgver=9.4
pkgrel=1
pkgdesc=""
arch=('any')
url="https://github.com/vanhauser-thc/thc-hydra"
license=('AGPL-3.0-or-later')
groups=()
depends=('gtk3' 'zlib' 'openssl')
makedepends=()
provides=('thc-hydra')
source=("https://github.com/vanhauser-thc/thc-hydra/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('de5a1e73673fdc2f193cfb1aeec337c9d8faad52b06524850f352a797a4a5ef08cba8fc51da96fed1db01d141127e58c2aa874027f51c40a94a474de778d5241')

build() {
	cd "$pkgname-$pkgver"
	./configure --prefix=/usr
	make
}

package() {
	cd "$pkgname-$pkgver"
	make DESTDIR="$pkgdir/" install
}
