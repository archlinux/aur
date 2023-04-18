# Maintainer: hexchain

pkgname=passt
pkgdesc='Plug A Simple Socket Transport'
_pkgver=2023_03_29.b10b983
pkgver="${_pkgver//_/}"
pkgrel=1
arch=('x86_64')
url='https://passt.top/passt/about/'
license=('GPL2')
source=("https://passt.top/passt/snapshot/passt-${_pkgver}.tar.zst")
sha256sums=('SKIP')
depends=('glibc')

build() {
    cd "$pkgname-$_pkgver"
    make
}

package() {
    cd "$pkgname-$_pkgver"
    make install DESTDIR="$pkgdir" prefix=/usr
    install -Dm644 LICENSES/* -t "$pkgdir/usr/share/licenses/$pkgname/"
}
