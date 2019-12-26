# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=dtool
pkgver=0.4.0
pkgrel=1
pkgdesc='A collection of development tools for numeric conversion'
arch=('i686' 'x86_64')
url="https://github.com/guoxbin/dtool"
license=('GPL3')
depends=()
conflicts=('dtool-git')
makedepends=('rust' 'cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('05ee5d3e4669d778d8e0c33a51d491607e382731cdc541a7cc8b38e75e57826b')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
    install -Dm755 "$srcdir/$pkgname-$pkgver/target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
