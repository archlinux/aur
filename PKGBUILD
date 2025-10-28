# Maintainer: execRooted <execrooted@gmail.com>

pkgname=root_boot
pkgver=0.1.3
pkgrel=1
pkgdesc="A Rust program that helps you boot into bootable devices directly from the os you're running (Windows/Linux compatable)"
arch=('x86_64')
url="https://github.com/execRooted/root_boot"
license=('MIT')
depends=()
makedepends=('rust' 'cargo')
source=("$url/archive/main.tar.gz"
        "install.sh"
        "uninstall.sh")
sha256sums=('SKIP'
            'SKIP'
            'SKIP')

build() {
    cd "$srcdir/$pkgname-main"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-main"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/local/bin/$pkgname"
    install -Dm644 "README.md" "$pkgdir/usr/share/doc/$pkgname/README.md"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm755 "install.sh" "$pkgdir/usr/share/$pkgname/install.sh"
    install -Dm755 "uninstall.sh" "$pkgdir/usr/share/$pkgname/uninstall.sh"
}

