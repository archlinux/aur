# Maintainer: iniVation AG <support@inivation.com>

pkgname=dv-processing
pkgver=1.0.0
pkgrel=1
pkgdesc="Generic algorithms for event cameras."
url="https://gitlab.com/inivation/dv/$pkgname/"
license=('Apache-2.0')
arch=('i686' 'x86_64' 'armv7h' 'aarch64')
groups=()
depends=('boost' 'opencv' 'eigen' 'fmt' 'lz4' 'zstd')
makedepends=('cmake' 'pkgconf')
provides=()
conflicts=()
replaces=()
options=()
source=("https://release.inivation.com/processing/$pkgname-$pkgver.zip")
noextract=()
sha256sums=('0f9465e0736dcb5d7a84d03b55e91209f282de60ec91c6f235b43b04eb765f92')

build() {
	cd "$srcdir/$pkgname-$pkgver"

	cmake -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_INSTALL_LIBDIR=lib -DENABLE_TESTS=1 -DENABLE_BENCHMARKS=0 -DENABLE_SAMPLES=0 .

	make
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

	DESTDIR="$pkgdir/" make install
}
