# Maintainer: Sven-Hendrik Haase <svenstaro@gmail.com>
pkgname=genact
pkgver=0.9.0
pkgrel=1
pkgdesc="A nonsense activity generator"
url="https://github.com/svenstaro/genact"
arch=("x86_64")
license=("MIT")
depends=('gcc-libs')
makedepends=("rust")
source=("$pkgname-$pkgver.tar.gz::https://github.com/svenstaro/$pkgname/archive/v$pkgver.tar.gz")
sha512sums=('119d3ecc1cc00834b51c83f1b26bb87d4ebaf867410b9649b267f0bdb0297a2b153df2c708d7efeb23970d45c9e764095369055f9629da960053d642d6b18358')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    cd "$srcdir/$pkgname-$pkgver"
    install -Dm 644 "LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
    install -Dm 755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
