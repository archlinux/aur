# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=lswt
pkgver=2.0.0
pkgrel=1
pkgdesc="List Wayland toplevels"
arch=('x86_64' 'aarch64')
url="https://sr.ht/~leon_plickat/lswt"
license=('GPL3')
depends=("wayland")
conflicts=("lswt-git")
source=("https://git.sr.ht/~leon_plickat/lswt/archive/v$pkgver.tar.gz")
sha256sums=('8e23cc5c00bb715b0a1610938111cb76eb9efe1eea87408123620a8a7155e6ab')

build() {
    cd "$pkgname-v$pkgver"
    make
}

package() {
    cd "$pkgname-v$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install 
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
