# Maintainer: Peter Kaplan <peter@pkap.de>
pkgname=stacktile
pkgver=0.1.1
pkgrel=3
pkgdesc="Layout generator for the river Wayland compositor"
arch=('x86_64')
url="https://sr.ht/~leon_plickat/stacktile/"
license=('GPL3')
makedepends=('git' 'wayland')
conflicts=('stacktile-git')
options=('!buildflags')
source=("git+https://git.sr.ht/~leon_plickat/stacktile#tag=v$pkgver")
sha256sums=('SKIP')

build() {
    cd "$pkgname"
    make
}

package() {
    cd "$pkgname"
    make DESTDIR="$pkgdir" PREFIX="/usr" install 
    install -Dm644 LICENSE -t "$pkgdir/usr/share/licenses/$pkgname"
}
