# Maintainer: Ben Goldberg <jediben97@gmail.com>

pkgname=servy
pkgver=1.0.0
pkgrel=2
pkgdesc="A tiny little web server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/zethra/servy"
license=('MIT' 'Apache')
source=("https://github.com/zethra/servy/archive/$pkgver.tar.gz")
depends=('gcc-libs-multilib')
makedepends=('rust' 'cargo')
sha256sums=("6da77ef18dd04c3840a5d3bebbf1552623d2357533405c32dfdb2853b8299c44")

build() {
    tar -xf $pkgver.tar.gz
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
