# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dr-Noob <peibolms at gmail dot com>

pkgname=cpufetch
pkgver=1.00
pkgrel=1
pkgdesc="Simple yet fancy CPU architecture fetching tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Dr-Noob/cpufetch"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        '001-Makefile.patch')
sha256sums=('2254c2578435cc35c4d325b25fdff4c4b681de92cbce9a7a36e58ad58a3d9173'
            '90f34a45065ac941daf050bf1ac8623daa2bbe4ab70b334eb2b69c8081795b46')

prepare() {
	patch -p1 -d "$pkgname-$pkgver" < 001-Makefile.patch
}

build() {
	make -C "$pkgname-$pkgver"
}

package() {
	make -C "$pkgname-$pkgver" DESTDIR="$pkgdir/" install
}
