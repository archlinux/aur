# Maintainer: shizy <shizukesa4 at gmail dot com>
pkgname=flap
pkgver=1.1
pkgrel=1
pkgdesc='An XCB based window geometry tool with support for relative/per-monitor positioning and resizing.'
arch=('x86_64')
url=https://github.com/shizy/flap
license=('MIT')
depends=('libxcb')
makedepends=('git')
source=("https://github.com/shizy/flap/archive/${pkgver}.tar.gz")
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
