# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=lswt
pkgver=1.0.2
pkgrel=1
pkgdesc="List Wayland toplevels"
arch=('x86_64')
url="https://sr.ht/~leon_plickat/lswt"
license=('GPL3')
depends=("wayland")
conflicts=("lswt-git")
source=("https://git.sr.ht/~leon_plickat/lswt/archive/v$pkgver.tar.gz")
sha256sums=('28810c124c0d017ffe41e4b91461a07692aa12a3cd49261c3297dfb0dcf2f4cf')

build() {
    cd "$pkgname-v$pkgver"
    make
}

package() {
    cd "$pkgname-v$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install 
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
