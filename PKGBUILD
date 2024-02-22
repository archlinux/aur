# Maintainer: Clarence <xjh.azzbcc@gmail.com>
_pkgname=libks
pkgname=libks2
pkgver=2.0.4
pkgrel=1
pkgdesc="Foundational support for signalwire C products"
depends=(util-linux-libs openssl)
makedepends=(cmake)
arch=('x86_64')
url="https://github.com/signalwire/libks"
license=('MIT' 'GPL')
source=("$pkgname-$pkgver.tar.gz::https://github.com/signalwire/$_pkgname/archive/v$pkgver.tar.gz")
sha256sums=('7a8aab7ec903de6a8f97e31326a4157c246f7d75ad5a05f185191273989068b8')

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

