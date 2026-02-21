# Maintainer: link2xt <link2xt@testrun.org>
pkgname=equihash
pkgver=1.0.10
pkgrel=1
epoch=
pkgdesc="Equihash: memory-hard PoW with fast verification"
arch=(x86_64)
url="https://github.com/stef/liboprf"
license=('CC0-1.0')
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
source=("${pkgname}-${pkgver}.tar.gz::https://github.com/stef/$pkgname/archive/refs/tags/v$pkgver.tar.gz")
noextract=()
b2sums=('4db437c14c5d79f6b42c20fc368a0fdac8f2c2828b3f0adcbf6a2c1b305259836aaf806aa9a0decda33199dd5db8599b32815ddefa9a24ede5cfe9548bf278b9')

build() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr
}

package() {
	cd "$pkgname-$pkgver"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
}
