# Maintainer: shizy <shizukesa4 at gmail dot com>
pkgname=gloom
pkgver=1.2
pkgrel=1
pkgdesc='a X11 backlight dimming, screen lock, and cursor management tool for laptops.'
arch=('x86_64')
url=https://github.com/shizy/gloom
license=('MIT')
depends=('libxrandr' 'libxfixes' 'libxi' 'xproto' 'libx11')
makedepends=('git')
source=("https://github.com/shizy/gloom/archive/${pkgver}.tar.gz")
md5sums=('SKIP')

build() {
    cd "${pkgname}-${pkgver}"
    make
}

package() {
    echo "$pkgdir"
    cd "${pkgname}-${pkgver}"
    make PREFIX="/usr" DESTDIR="$pkgdir" install
}
