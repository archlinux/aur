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
sha512sums=("e2729c760a3ca6a4afe808aeba697fc15fbbca1996409d9bc73a5a6a241d56ae20182560ea03b88bcfebcbb4a5d80720f841ebad6971a203b3d40ff7448ce34d")

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
