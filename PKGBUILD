# Maintainer: Ted To <wintrymix@theo.to>
pkgname="brlaser"
pkgver=6.2.7
pkgrel=1
pkgdesc="Brother laser printer driver"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Owl-Maintain/brlaser"
license=('GPL2')
depends=('cups')
makedepends=('cmake')
source=("https://github.com/Owl-Maintain/${pkgname}/archive/refs/tags/v${pkgver}.tar.gz")
sha512sums=('f82364376df149710cf63eb49a13fa900c6bdd39543eed156c6b396fd4156e612b2de36a8c9e71e691c4c22de3cc83c0ac818477514be5a48edfaf9d5beee57c')

build() {
	cd "${pkgname}-${pkgver}"
	cmake .
}

check() {
	cd "${pkgname}-${pkgver}"
	make -k check
}

package() {
	cd "${pkgname}-${pkgver}"
	make DESTDIR="$pkgdir/" install
}
