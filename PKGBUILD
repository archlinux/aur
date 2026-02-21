# Maintainer: link2xt <link2xt@testrun.org>
pkgname=liboprf
pkgver=0.9.3
pkgrel=1
epoch=
pkgdesc="library providing OPRF and Threshold OPRF based on libsodium"
arch=(x86_64)
url="https://github.com/stef/liboprf"
license=('LGPL-3.0-or-later')
groups=()
depends=('libsodium')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stef/$pkgname/archive/refs/tags/v$pkgver.tar.gz"
	"https://github.com/stef/$pkgname/releases/download/v$pkgver/$pkgname-$pkgver.tar.gz.asc")
noextract=()
b2sums=('628a6e9549ba688ade57b8b07a9cb488a3e750aabef0619141f16f98c7bf99d56185e0f9daa3b11ca55407e1549af9c932940518aa3dc6eb6020334aefcfdb25'
        'SKIP')
validpgpkeys=('AABDE16CB6AF5CD10A28DFF2970DEB6694D50988')

prepare() {
	cd "$pkgname-$pkgver"
}

build() {
	cd "$pkgname-$pkgver"/src
	PREFIX=/usr make
}

package() {
	cd "$pkgname-$pkgver"/src
	make DESTDIR="$pkgdir/" install
}
