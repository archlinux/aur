# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=lswt
pkgver=1.0.4
pkgrel=2
pkgdesc="List Wayland toplevels"
arch=('x86_64' 'aarch64')
url="https://sr.ht/~leon_plickat/lswt"
license=('GPL3')
depends=("wayland")
conflicts=("lswt-git")
source=("https://git.sr.ht/~leon_plickat/lswt/archive/v$pkgver.tar.gz")
sha256sums=('a1a422d996e9dbfa2d07daf5588ede280157ab0d0cc7e918d7c16999f4e14b5f')

build() {
    cd "$pkgname-v$pkgver"
    make
}

package() {
    cd "$pkgname-v$pkgver"
    make DESTDIR="$pkgdir" PREFIX="/usr" install 
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
