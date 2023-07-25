# Maintainer: Clarence <xjh.azzbcc@gmail.com>
_pkgname=libks
pkgname=libks2
pkgver=2.0.2
pkgrel=1
pkgdesc="Foundational support for signalwire C products"
depends=(util-linux-libs openssl)
makedepends=(cmake)
provides=("$_pkgname")
conflicts=("$_pkgname")
arch=('x86_64')
url="https://github.com/signalwire/libks"
license=('MIT' 'GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/signalwire/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('af94f9fcdb2022b8f09187309ac2d372a5a4cc639af77cd4375f2d5c88b4fd63')

build() {
    cd "$_pkgname-$pkgver"
    cmake .
    make
}

package() {
    cd "$_pkgname-$pkgver"
    make DESTDIR="$pkgdir" install

    install -Dm644 ${srcdir}/$_pkgname-$pkgver/copyright $pkgdir//usr/share/licenses/libks/LICENSE
}

