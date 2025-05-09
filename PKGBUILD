# Maintainer: prime-run <prime-run@github.com>
pkgname="wallrust"
pkgver=v1.0.5
pkgrel=5
pkgdesc="Extract color palettes from images and instantly rice any setup or config file. This package lets you blueprint your desired files, automatically populates them with colors and palettes, and saves them to your specified paths."
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

build() {
    cd "$pkgname"
    cargo build --release
}

package() {
    cd "$pkgname"
    install -Dm755 "target/release/wallrust" "$pkgdir/usr/bin/$pkgname"
    install -Dm644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
