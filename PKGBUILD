# Maintainer: Clarence <xjh.azzbcc@gmail.com>
pkgname=libks
pkgver=1.8.3
pkgrel=1
pkgdesc="Foundational support for signalwire C products"
depends=(util-linux-libs openssl)
makedepends=(cmake)
arch=('x86_64')
url="https://github.com/signalwire/libks"
license=('MIT' 'GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/signalwire/$pkgname/archive/v$pkgver.tar.gz")
sha256sums=('c677c36a0d8ceca2e53e07d1de66b87045ac2784df458d012557e2432692528b')

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

