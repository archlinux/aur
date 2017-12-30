# Maintainer: Ben Goldberg <jediben97@gmail.com>

pkgname=servy
pkgver=0.1.0
pkgrel=1
pkgdesc="A tiny little web server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/zethra/servy"
license=('MIT' 'Apache')
source=("https://github.com/zethra/servy/archive/v$pkgver.tar.gz")
depends=('gcc-libs-multilib')
makedepends=('rust' 'cargo')
sha256sums=("3920c06cebc223cc5dc72a40cb02be7ee06e83d2784a023eeb13b4c0552a8402")

build() {
    tar -xf v$pkgver.tar.gz
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
    install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE-APACHE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-APACHE"
    install -D -m644 "$srcdir/$pkgname-$pkgver/LICENSE-MIT" "$pkgdir/usr/share/licenses/$pkgname/LICENSE-MIT"
}
