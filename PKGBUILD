# Maintainer: Ben Goldberg <jediben97@gmail.com>

pkgname=servy
pkgver=0.2.0
pkgrel=1
pkgdesc="A tiny little web server"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://github.com/zethra/servy"
license=('MIT' 'Apache')
source=("https://github.com/zethra/servy/archive/v$pkgver.tar.gz")
depends=('gcc-libs-multilib')
makedepends=('rust' 'cargo')
sha256sums=("3c1024d93539ba52c5276d628281067dc97ea6f24ea5035775380d853da073f9")

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
