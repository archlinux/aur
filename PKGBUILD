# Maintainer: Ben Westover <me@benthetechguy.net>

pkgname=rokuecp
pkgver=0.2.0
pkgrel=1
pkgdesc="C library to interact with Roku devices remotely using ECP"
arch=('x86_64' 'i686' 'aarch64' 'armv7h')
url="https://github.com/benthetechguy/rokuecp"
license=('GPL')
depends=('libsoup3' 'gssdp' 'libxml2')
makedepends=('cmake')
source=("https://github.com/benthetechguy/$pkgname/releases/download/v$pkgver/${pkgname}-${pkgver}_src.tar.gz"
        "https://github.com/benthetechguy/$pkgname/releases/download/v$pkgver/${pkgname}-${pkgver}_src.tar.gz.asc")
sha256sums=('e904f37940717d08526ccbf2860bc0ff9117d2c3d93136e1f48b95eff42bca2a' 'SKIP')
validpgpkeys=("3869DA72A461754E9E366B45C311C5F54E89B698")

build() {
        cmake -B build -S "$pkgname-$pkgver" -DCMAKE_INSTALL_PREFIX=/usr
	cmake --build build
}

package() {
	DESTDIR="$pkgdir" cmake --install build
}
