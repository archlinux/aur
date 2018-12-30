# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=sd
pkgver=0.4.0
pkgrel=1
pkgdesc='Intuitive find & replace'
arch=('i686' 'x86_64')
url="https://github.com/chmln/sd"
license=('MIT')
depends=()
conflicts=('sd-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('974189be2e5c00baa8839462ad56ec32c2f78a362f97bc2f151ed81ebc5b0a21')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
