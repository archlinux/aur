# Maintainer: Funami
pkgname=cargo-nono-bin
pkgver=0.1.9
pkgrel=2
pkgdesc="A cargo subcommand to detect (possible) no_std compatibility of your crate and dependencies"
arch=('x86_64')
url="https://github.com/hobofan/cargo-nono"
license=('APACHE' 'MIT')
provides=('cargo-nono')
conflicts=('cargo-nono')
source=("$pkgname-$pkgver.tar.gz::https://github.com/hobofan/cargo-nono/releases/download/$pkgver/cargo-nono-$pkgver-x86_64-unknown-linux-gnu.tar.gz"
        "$pkgname-$pkgver-LICENSE-MIT::https://raw.githubusercontent.com/hobofan/cargo-nono/$pkgver/LICENSE-MIT")
noextract=("$pkgname-$pkgver.tar.gz")
sha256sums=('83a5985c85a7096afb3db17dce0b8ca0d41d146a26060aeba053900d8ed252be'
            '563ddd25bbd22b8ecf5b28391050fb0ffc8e71ab82a377346784dea80bbbe327')

prepare() {
  mkdir -p "$pkgname-$pkgver"
  /usr/bin/bsdtar -xf "$pkgname-$pkgver.tar.gz" -C "$pkgname-$pkgver"
}

package() {
  install -Dm644 "$pkgname-$pkgver-LICENSE-MIT" "$pkgdir/usr/share/licenses/cargo-nono/LICENSE-MIT"
  
  cd "$pkgname-$pkgver"
  install -Dm755 cargo-nono -t "$pkgdir/usr/bin"
}
