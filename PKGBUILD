# Maintainer: Luis Martinez <luis dot martinez at disroot dot org>
# Contributor: Dr-Noob <peibolms at gmail dot com>

pkgname=cpufetch
pkgver=1.01
pkgrel=1
pkgdesc="Simple yet fancy CPU architecture fetching tool"
arch=('x86_64' 'i686' 'arm' 'armv6h' 'armv7h' 'aarch64')
url="https://github.com/Dr-Noob/cpufetch"
license=('MIT')
depends=('glibc')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz"
        '001-Makefile.patch')
sha256sums=('d4fe25adc4d12f5f1dc7a7e70a4ed92e9807b6a1ad0294c563a0250f7bd6aca1'
            'c9f71ab8ef432d8c808cac86e95ab5ddedc1e8355ccd634b877b908b58953d58')

prepare() {
	patch -p1 -d "$pkgname-$pkgver" < 001-Makefile.patch
}

build() {
	make -C "$pkgname-$pkgver"
}

package() {
	make -C "$pkgname-$pkgver" DESTDIR="$pkgdir/" install
}
