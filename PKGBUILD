# Maintainer: Viacheslav Chimishuk <vchimishuk@yandex.ru>
pkgname=loderunner-ng
pkgver=0.1.4
pkgrel=1
pkgdesc="Classic Lode Runner game remake"
arch=('x86_64')
url="https://github.com/vchimishuk/loderunner-ng"
license=('GPL-3.0-or-later')
makedepends=('git' 'cmake')
depends=('sdl2' 'sdl2_image' 'sdl2_mixer')
source=("https://github.com/vchimishuk/loderunner-ng/archive/refs/tags/${pkgver}.tar.gz")
sha256sums=('ee7d9828a8acfc535255ed50c6dd1b9d1040aebc4a6eb72df853e72c65c6e7ba')

build() {
    cd "$pkgname-$pkgver"
    cmake -DCMAKE_INSTALL_PREFIX=/usr .
    cmake --build .
}

package() {
    cd "$pkgname-$pkgver"
    cmake --install . --prefix "$pkgdir/usr"
}
