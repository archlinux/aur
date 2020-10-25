pkgname=jstar
pkgver=1.2.4
pkgrel=1
pkgdesc="A Lightweight Embeddable Scripting Language"
arch=('i686' 'x86_64')
url="https://jstar-lang.github.io/docs/"
license=('MIT')
makedepends=('cmake>=3.9' 'python>=2.7')
source=("https://github.com/jstar-lang/jstar/archive/v${pkgver}.tar.gz")
sha512sums=("72baf230c5ebfcf22a59ea553bbdb332848cfec725f38115bba5555836f0d94e75c6d19c0d78b1d0d2a10697a9fc9d779b15197244be831df5384bb6d7f281b3")

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
