# Maintainer: Nzeo <archlinux@netzego.de>
# Contributor: Michał Wojdyła < micwoj9292 at gmail dot com >
# Contributor: Andras Czigany <andras dot czigany dot 'thirteen with digits' at gmail dot com>

pkgname=xorg-rgb
pkgver=1.1.1
pkgrel=1
pkgdesc="X colorname to RGB mapping database"
arch=('x86_64')
url="https://xorg.freedesktop.org/"
license=('MIT-open-group')
depends=()
makedepends=()
source=("https://www.x.org/releases/individual/app/rgb-${pkgver}.tar.xz")
sha256sums=('c80ff280a02f56c30fadc2dfa210fc6979c4ab968afa315278cb97768b64ecab')

build() {
    cd "${srcdir}/rgb-${pkgver}"
    ./configure --prefix=/usr
    make
}

package() {
    cd "${srcdir}/rgb-${pkgver}"
    make DESTDIR="$pkgdir" install
    install -m755 -d "${pkgdir}/usr/share/licenses/${pkgname}"
    install -m644 COPYING "${pkgdir}/usr/share/licenses/${pkgname}/"
}
