# Maintainer: Artem Vlasenko <artemvlas at proton dot me>
pkgname=veretino
pkgver=0.3.12
pkgrel=1
pkgdesc="Multiple checksums calculator"
arch=('x86_64')
url="https://github.com/artemvlas/veretino"
license=('GPL3')
depends=('qt5-base' 'qt5-svg')

source=(https://github.com/artemvlas/veretino/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=(b564ca9386f245913a39f10691ec4e2e8c36d747c17313b40d7092eff1a56b04)

build() {
	cd "$pkgname-$pkgver"
	mkdir build
	cd build
	qmake ..
	make -j$(nproc)
}

package() {
	cd "$pkgname-$pkgver"
	cd build
	make install INSTALL_ROOT="${pkgdir}"
}
