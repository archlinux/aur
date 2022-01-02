# Maintainer: DevHyperCoder <arduinoleo88 at gmail dot com>

pkgname=rbmenu-tui
pkgver=0.6.1
pkgrel=2
pkgdesc="Terminal User Interface for RBMenu"
arch=('x86_64')
url="https://github.com/DevHyperCoder/rbmenu-tui"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'rust' 'cargo' 'rbmenu') 
source=("${url}/archive/v${pkgver}.zip")
noextract=()
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "target/release/rbmenu-tui" \
        -t "$pkgdir/usr/bin/"
}
