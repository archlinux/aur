# Maintainer: callmetango

pkgname=sonic-breeze-sddm
pkgver=6.8.0
pkgrel=1
pkgdesc="Sonic Breeze SDDM Theme"
arch=(x86_64)
url='https://github.com/Sonic-DE/sonic-breeze-sddm'
license=('LGPL-2.0-or-later')
depends=(sonic-workspace)
makedepends=(sonic-frameworks-cmake-modules)
options=('!debug')
groups=(sonicde)
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('3d65892246d009bebb33059f12217bb36101cb91f79371496330ddb98e913cd6')

build() {
	cmake -B build -S "$pkgname-$pkgver" \
		-DBUILD_TESTING=OFF
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
