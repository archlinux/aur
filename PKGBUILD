# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=sd
pkgver=0.2.0
pkgrel=1
pkgdesc='Intuitive find & replace'
arch=('i686' 'x86_64')
url="https://github.com/chmln/sd"
license=('MIT')
depends=()
conflicts=('sd-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d6fd8b1be9c83c0875f5dd20bb7da10ce3cd8a71cf0322e5818b055a7a466e3b')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
