# Maintainer: Mario Jiménez <mario.emilio.j@gmail.com>

pkgname=touchegg-music-client
pkgver=1.1.3
pkgrel=1
pkgdesc="Widget for music and volume control, connected to touchegg's daemon"
arch=('x86_64')
url="https://github.com/MarioJim/touchegg-music-client"
license=('GPL3')
depends=('touchegg' 'cairomm' 'glibmm' 'libpulse')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(be2bc122741eed0e260a8dc118e6680ce962ecb9f2053cff6cc5f598f2046a4f)

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
