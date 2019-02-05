# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=sd
pkgver=0.4.3
pkgrel=1
pkgdesc='Intuitive find & replace'
arch=('i686' 'x86_64')
url="https://github.com/chmln/sd"
license=('MIT')
depends=()
conflicts=('sd-git')
makedepends=('rust' 'cargo' 'git')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('d3d463c36597158cc5a8ac327c1710a73825ae1a960ead707915d98de4dc8732')

build() {
  cd "$pkgname-$pkgver"
  /usr/bin/cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
