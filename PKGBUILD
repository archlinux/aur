pkgname=rustybrain
pkgver=0.1.0
pkgrel=1
pkgdesc="A CLI based Task Management App for Archlinux"  # Replace with an actual description
arch=('x86_64')
url="https://github.com/sricharanandra/rustybrain"  # Update with your actual GitHub repo URL
license=('Apache')  # Change if you use a different license
depends=('rust' 'cargo')  # List only runtime dependencies here (e.g., libraries)
makedepends=('rust' 'cargo')  # List build dependencies here
source=("$pkgname-$pkgver.tar.gz::https://github.com/sricharanandra/rustybrain/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('SKIP')  # Replace 'SKIP' with actual checksum for better security

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}

