# Maintainer: DevHyperCoder <arduinoleo88 at gmail dot com>

pkgname=rbmenu
pkgver=0.6.1
pkgrel=2
pkgdesc="Rust Bookmark (d)Menu"
arch=('x86_64')
url="https://github.com/DevHyperCoder/rbmenu"
license=('GPL')
groups=()
depends=()
makedepends=('git' 'rust' 'cargo' ) 
source=("${url}/archive/v${pkgver}.zip")
noextract=()
md5sums=('SKIP')

build() {
	cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
	cd "$srcdir/$pkgname-$pkgver"

    install -Dm755 "target/release/rbmenu" \
        -t "$pkgdir/usr/bin/"

    install -Dm644 "res/rbmenu.1" \
        "$pkgdir/usr/share/man/man1/${pkgname}.1"
}
