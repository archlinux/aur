# Maintainer: Mario Jiménez <mario.emilio.j@gmail.com>

pkgname=touchegg-music-client
pkgver=1.0.0
pkgrel=1
pkgdesc="Widget for music and volume control, connected to touchegg's daemon"
arch=('i686' 'x86_64')
url="https://github.com/MarioJim/touchegg-music-client"
license=('GPL3')
depends=('touchegg' 'libpulse')
makedepends=('cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=(8ecf6124188f6a158052c57ecf1426a80ce3424efa2cbc45b0fbbc89dde79534)

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
