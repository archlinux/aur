# Maintainer: Sashanoraa <sasha@noraa.gay>

pkgname=kitty-img
pkgver=0.1.0
pkgrel=1
pkgdesc="Print images inline in kitty"
arch=('x86_64' 'i686' 'arm' 'armv7h' 'aarch64')
url="https://sr.ht/~zethra/kitty-img/"
license=('MIT')
source=("https://git.sr.ht/~zethra/kitty-img/archive/$pkgver.tar.gz")
makedepends=('rust' 'cargo')
sha256sums=('49dd64b4b353a85a16488f9a293bafb7b68b811ef2fa8d7d24116e32e5854fe8')

build() {
    cd "$srcdir/$pkgname-$pkgver"
    cargo build --release --locked
}

package() {
    install -D -m755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
