# Maintainer: Nathanael Demacon <nathanael.dmc[at]outlook[dot]fr>

pkgname=sshs
pkgver="1.4.2"
pkgrel="1"
pkgdesc="Terminal user interface for SSH"
arch=('any')
url="https://github.com/quantumsheep/sshs"
license=('MIT')
depends=('go' 'openssh')
source=("https://github.com/quantumsheep/sshs/archive/refs/tags/$pkgver.tar.gz")
sha256sums=('8b102f4dfdd6cae7ed15207c04540b73c8e43358321c2409ed73ecfb1ad4b369')

build() {
    cd "$pkgname-$pkgver"
    make VERSION="$pkgver"
}

package() {
    cd "$pkgname-$pkgver"
    make DESTDIR="$pkgdir" install
}
