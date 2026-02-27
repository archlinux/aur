# Maintainer: sakuyma <yerkin.timofey@protonmail.com>

pkgname=dotfiles-installer
pkgver=0.1.5
pkgrel=1
pkgdesc="A Rust-powered tool to set up your Arch Linux system with dotfiles, drivers, and packages"
arch=('x86_64')
url="https://github.com/sakuyma/dotfiles-installer"
license=('MIT')
depends=('git' 'stow' 'paru')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::https://github.com/sakuyma/dotfiles-installer/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('3d933dc56653932d4793075aab550eca59e90af5f8cbf6564d951bdc636d8276')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --frozen
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
