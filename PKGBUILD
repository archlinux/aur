# Maintainer: Mario Jiménez <mario.emilio.j@gmail.com>

pkgname=touchegg-music-client
pkgver=1.1.2
pkgrel=1
pkgdesc="Widget for music and volume control, connected to touchegg's daemon"
arch=('x86_64')
url="https://github.com/MarioJim/touchegg-music-client"
license=('GPL3')
depends=('touchegg' 'cairomm' 'glibmm' 'libpulse')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(cf79f5cbf57e2daf70bee5a9c8a325fc86d35982e8e71ebeef690cd175a948ab)

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE=Release \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    make -C build
}

package() {
    install -Dm 755 "build/$pkgname" -t "${pkgdir}/usr/bin/"
}
