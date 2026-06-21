# Maintainer: 71 <71.zetax@gmail.com>
pkgname=fcitx5-pinboard
pkgver=0.1.0
pkgrel=1
pkgdesc="Fcitx5 clipboard history addon with pinning, using the native candidate window"
arch=('x86_64')
url="https://github.com/7-1/fcitx5-pinboard"
license=('LGPL-2.1-or-later')
depends=('fcitx5')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('810bbdff1a78237a125ca3de4ce843e83d9517bccea8e40b4dd130191fa6a852')

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -DCMAKE_BUILD_TYPE=Release
    cmake --build build
}

package() {
    DESTDIR="$pkgdir" cmake --install build
    install -Dm644 "$pkgname-$pkgver/LICENSE" \
        "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
