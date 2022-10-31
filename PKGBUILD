# Maintainer: Clarence <xjh.azzbcc@gmail.com>
pkgname=libks
pkgver=1.8.0
pkgrel=1
pkgdesc="Foundational support for signalwire C products"
depends=(util-linux-libs openssl)
makedepends=(cmake)
arch=('x86_64')
url="https://github.com/signalwire/libks"
license=('MIT' 'GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/signalwire/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('b42544a5544ac00ceeb0675a9e6a99c8e6ecc752452c7f38c6ffe32fbedb906d')

build() {
    cd "$pkgname-$pkgver"
    cmake .
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    install -Dm644 ${srcdir}/$pkgname-$pkgver/copyright $pkgdir//usr/share/licenses/libks/LICENSE
}

