# Maintainer: callmetango

pkgname=sonic-silver-sddm
pkgver=1.1.0
pkgrel=3
pkgdesc="Sonic Silver SDDM Theme"
arch=('any')
url='https://github.com/Sonic-DE/sonic-silver-sddm'
license=(
	'GPL-2.0-or-later'
	'LGPL-2.0-or-later'
)
depends=(
	'sddm'
	'sonic-workspace'
)
makedepends=('sonic-frameworks-cmake-modules')
options=('!debug')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('7af2afea4e7724bafe7e7cb37ad07bc0f523bad1cef774680ef9163adb97a0d0')

build() {
	cmake -B build -S "$pkgname-$pkgver"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
