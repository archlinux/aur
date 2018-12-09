# Maintainer: Ainola <ainola@archlinux.org>
# Contributor: emersion

pkgname=xcb-util-errors
pkgver=1.0
pkgrel=2
pkgdesc='XCB errors library'
arch=('x86_64')
url='https://cgit.freedesktop.org/xcb/util-errors/'
license=('MIT')
depends=('libxcb')
source=("$pkgname-$pkgver.tar.bz2::https://xcb.freedesktop.org/dist/xcb-util-errors-$pkgver.tar.bz2")
sha256sums=('682681769e818ba085870d1ccd65f1f282ca16ca7d6f0f73ee70bc3642aa1995')

build() {
    cd "$pkgname-$pkgver"
    ./configure --prefix=/usr
    make
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir/" install
    install -Dm644 COPYING -t "$pkgdir/usr/share/licenses/$pkgname/"
}
