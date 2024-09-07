# Maintainer: Ted To <wintrymix@theo.to>
pkgname="brlaser"
pkgver=6.2.6
pkgrel=1
pkgdesc="Brother laser printer driver"
arch=('x86_64' 'armv7h' 'aarch64')
url="https://github.com/Owl-Maintain/brlaser"
license=('GPL2')
depends=('cups')
makedepends=('cmake')
source=("https://github.com/Owl-Maintain/${pkgname}/archive/v${pkgver}.tar.gz")
sha512sums=('285a053473ae576167e653bb94c20a1ae676c1a39ec87d9b14c664e389a4713d93ca29d5cefd92a6793e1ffbc8b03b119ea8cd903749ae21c9354ce30d470a51')

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
