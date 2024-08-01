# Maintainer: Clarence <xjh.azzbcc@gmail.com>
_pkgname=libks
pkgname=libks2
pkgver=2.0.6
pkgrel=1
pkgdesc="Foundational support for signalwire C products"
depends=(util-linux-libs openssl)
makedepends=(cmake)
arch=('x86_64')
url="https://github.com/signalwire/libks"
license=('MIT' 'GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/signalwire/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('0b78d07d7a4ebf6c58d898bde2873bc40941ed29ca237a3c9939860de4a0ba25')

build() {
    cd "$_pkgname-$pkgver"
    cmake .
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    install -Dm644 ${srcdir}/$_pkgname-$pkgver/copyright $pkgdir//usr/share/licenses/$pkgname/LICENSE
}

