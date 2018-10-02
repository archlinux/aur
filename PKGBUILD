# Maintainer: LambdAurora <aurora42lambda@gmail.com>
pkgname=lambdacommon
pkgver=1.7.0
pkgrel=1
pkgdesc="A library written in C++ with common features."
arch=('i686' 'x86_64' 'armv7h')
url="https://github.com/AperLambda/lambdacommon"
license=('MIT')
makedepends=('cmake')
conflicts=('lambdacommon-git')
options=()
install=
source=("https://github.com/AperLambda/$pkgname/archive/v$pkgver.tar.gz")
md5sums=('SKIP')
validpgpkeys=()

build() {
	cd "$pkgname-$pkgver"
	cmake .\
		-DCMAKE_INSTALL_PREFIX=/usr \
		-DCMAKE_BUILD_TYPE=Release
	cmake --build .
}

check() {
	cd "$pkgname-$pkgver"
	#make -k check
}

package() {
	cd "$pkgname-$pkgver"
	install -D -m644 "LICENSE" "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
	make DESTDIR="$pkgdir/" install
}
