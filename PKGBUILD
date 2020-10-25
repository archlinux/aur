# Mantainer: Fabrizio Pietrucci <bamlessnty5@gmail.com>

pkgname=jstar
pkgver=1.2.5
pkgrel=1
pkgdesc="A Lightweight Embeddable Scripting Language"
arch=('i686' 'x86_64')
url="https://github.com/jstar-lang/jstar"
license=('MIT')
makedepends=('cmake>=3.9' 'python>=2.7')
source=("https://github.com/jstar-lang/jstar/archive/v${pkgver}.tar.gz")
sha512sums=("27b7293443b216d4007a552feb65be1f7ee9c93f1e51b7963007a902c0427eab522f394100303387fa44a7da2b7cd933d1321091a1c5be3cd9a4e2b8ab53ee28")

build() {
	cd "${srcdir}/${pkgname}-${pkgver}"
	mkdir -p build
	cd build
  
	cmake -DCMAKE_INSTALL_PREFIX=${pkgdir}/usr ../
	make -j
}

package() {
	cd "${srcdir}/${pkgname}-${pkgver}/build"
	make install
}
