# Maintainer: prime-run <prime-run@github.com>
pkgname="wallrust"
pkgver=20250430
pkgrel=1
pkgdesc="A blazingly fast and feature-rich tool to extract color palettes from images | written in Rust"
arch=("x86_64")
url="https://github.com/prime-run/wallrust"
license=('MIT')
depends=("imagemagick")
makedepends=(
    'cargo'
    'git'
)
conflicts=("wallrust-bin")
source=('wallrust::git+https://github.com/prime-run/wallrust.git')
sha256sums=('SKIP')

pkgver() {
    date +%Y%m%d
}
build() {
    cd "$pkgname"
    cargo build --release --frozen --no-default-features
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/wallrust" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
