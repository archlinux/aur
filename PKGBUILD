# Maintainer: Clarence <xjh.azzbcc@gmail.com>
pkgname=libks
pkgver=1.8.2
pkgrel=1
pkgdesc="Foundational support for signalwire C products"
depends=(util-linux-libs openssl)
makedepends=(cmake)
arch=('x86_64')
url="https://github.com/signalwire/libks"
license=('MIT' 'GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/signalwire/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('131d7896c81a7f3c9bf06860e4f564ca558d4be1614568fec688b3eb66d38107')

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

