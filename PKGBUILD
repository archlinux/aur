# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.17.1
pkgrel=1
pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('MPL2')
depends=('openssl')
conflicts=('mdcat-git')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('f531447edf7a2433148af15f555f7771756c1cfa7d4c69684e09cb18ab9e89df')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
