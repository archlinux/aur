# Maintainer: callmetango
# Contributor:Antonio Rojas <arojas@archlinux.org>

pkgname=sonic-frameworks-keyring-pam
pkgver=6.8.0
pkgrel=1
pkgdesc='SonicDE keyring PAM integration'
arch=('x86_64')
url='https://github.com/Sonic-DE/sonic-frameworks-keyring-pam'
license=('LGPL-2.0-or-later')
depends=(
	'glibc'
	'libgcrypt'
	'pam'
	'sh'
	'socat'
	'sonic-frameworks-keyring'
)
makedepends=('sonic-frameworks-cmake-modules')
provides=('kwallet-pam')
conflicts=('kwallet-pam')
groups=('sonicde')
source=("$pkgname-$pkgver.tar.gz::${url}/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('37865ddaee414f40bcdf1ab4846eafb41fade3bb2604927e2d1e6a9c281d8c0d')

build() {
	cmake -B build -S "$pkgname-$pkgver"
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
