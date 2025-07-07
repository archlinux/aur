# Maintainer: Byson94 <byson94wastaken@gmail.com>
pkgname=xfsrtray-git
pkgver=1.1.0
pkgrel=1
pkgdesc="A floating and customizable system tray for Linux"
arch=('x86_64')
url="https://github.com/Byson94/xfsrtray"
license=('GPL')
depends=()
makedepends=('cargo')
provides=('xfsrtray')
conflicts=('xfsrtray-bin' 'xfsrtray')
source=("git+https://github.com/Byson94/xfsrtray.git")
sha256sums=('SKIP')

pkgver() {
    cd "$srcdir/xfsrtray"
    git describe --long --tags | sed 's/^v//;s/-/./g'
}

build() {
    cd "$srcdir/xfsrtray"
    cargo build --release --locked
}

package() {
    cd "$srcdir/xfsrtray"
    install -Dm755 "target/release/xfsrtray" "$pkgdir/usr/bin/xfsrtray"
}
