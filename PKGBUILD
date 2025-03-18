pkgname=walrs
pkgver=1.0.0
pkgrel=1
pkgdesc="walrs is a fast color scheme generator."
arch=('x86_64')
url="https://github.com/Pixel2175/walrs"
license=('MIT')
depends=('rust' 'make')
makedepends=('git')
source=("git+https://github.com/Pixel2175/walrs.git")
sha256sums=('SKIP')

build() {
    cd "$srcdir/$pkgname"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname"
    install -Dm755 target/release/walrs "$pkgdir/usr/bin/walrs"
    mkdir -p "$pkgdir/home/$USER/.config/walrs"
    cp -r templates "$pkgdir/home/$USER/.config/walrs"
}

clean() {
    cd "$srcdir/$pkgname"
    cargo clean
}

