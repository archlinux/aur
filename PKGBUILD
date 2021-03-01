# Maintainer: Michael Plotke <bdjnks@gmail.com>

pkgname=gemserv
pkgver='v0.4.5'
pkgrel=1
pkgdesc="A Gemini server written in Rust."
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://git.sr.ht/~int80h/$pkgname"
license=('MIT')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
depends=('openssl' 'gcc-libs')
makedepends=('rust' 'cargo')
sha256sums=("7aeb5edc8af6ebefc2331aebc0c360798711c2fb16ee9cbde8c5c4f9502c491f")

build() {
    tar -xf $pkgname-$pkgver.tar.gz
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 755 target/release/$pkgname -t $pkgdir/usr/bin
    install -Dm 644 LICENSE $pkgdir/usr/share/licenses/$pkgname/LICENSE
}
