# Maintainer: dozaxcx <your-email@example.com>
pkgname=koteyscanner
pkgver=1.0.0
pkgrel=1
pkgdesc="Многофункциональный порт-сканер с котиком - красивый, быстрый и удобный инструмент для сетевого сканирования"
arch=('x86_64' 'i686' 'aarch64')
url="https://github.com/dozaxcx/koteyscanner"
license=('MIT')
depends=('gcc-libs')
makedepends=('gcc')
source=("koteyscanner.cpp" "LICENSE" "README.md")
md5sums=('SKIP' 'SKIP' 'SKIP')

build() {
    g++ -std=c++11 -pthread -O2 koteyscanner.cpp -o koteyscanner
}

package() {
    install -Dm755 koteyscanner "$pkgdir/usr/bin/koteyscanner"
    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm644 "$srcdir/README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
}
