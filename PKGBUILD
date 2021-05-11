# Maintainer: Mario Jiménez <mario.emilio.j@gmail.com>

pkgname=touchegg-music-client
pkgver=1.1.0
pkgrel=1
pkgdesc="Widget for music and volume control, connected to touchegg's daemon"
arch=('x86_64')
url="https://github.com/MarioJim/touchegg-music-client"
license=('GPL3')
depends=('touchegg' 'cairomm' 'glibmm' 'libpulse')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(7010de22ee6c2b4619f0eba888ae3174d5b4f12727d39f75ddde582c906f5e44)

build() {
    cmake -B build -S "$pkgname-$pkgver" \
        -DCMAKE_BUILD_TYPE='None' \
        -DCMAKE_INSTALL_PREFIX=/usr \
        -Wno-dev
    make -C build
}

package() {
    install -Dm 755 "build/$pkgname" -t "${pkgdir}/usr/bin/"
}
