# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=dtool
pkgver=0.2.1
pkgrel=1
pkgdesc='A collection of development tools for numeric conversion'
arch=('i686' 'x86_64')
url="https://github.com/guoxbin/dtool"
license=('GPL3')
depends=()
conflicts=('dtool-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('f91b9883bd22763f75cd5db78e8dc6f75ddb9aa0948a44d08d23edb9c060d463')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
