# Maintainer: Chanuka Williams <chanuka.williams@outlook.com>
pkgname=openskydimo
pkgver=1.0.2
pkgrel=1
pkgdesc="OpenSkydimo ambient lighting daemon and CLI"
arch=('x86_64')
url="https://github.com/chanuka-williams/OpenSkydimo"
license=('MIT')
depends=('glibc' 'gcc-libs')
makedepends=('cmake' 'gcc')
source=("$pkgname-$pkgver.tar.gz::https://github.com/chanuka-williams/OpenSkydimo/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('aa001ba734d210f7a651c6a1cdcbbb2a1dba5cb65f18021afd5d65da611ae312')

build() {
    cd "OpenSkydimo-$pkgver"
    cmake -B build -DCMAKE_BUILD_TYPE=Release -DCMAKE_INSTALL_PREFIX=/usr
    cmake --build build
}

package() {
    cd "OpenSkydimo-$pkgver"
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
