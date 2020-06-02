# Maintainer: Wesley Moore <wes@wezm.net>
pkgname=mdcat
pkgver=0.18.2
pkgrel=1
pkgdesc='Sophisticated Markdown rendering for the terminal'
arch=('i686' 'x86_64')
url="https://github.com/lunaryorn/mdcat"
license=('MPL2')
depends=('openssl')
conflicts=('mdcat-git')
makedepends=('cargo')
source=("$pkgname-$pkgver.tar.gz::$url/archive/$pkgname-$pkgver.tar.gz")
sha256sums=('1098fac512072db21e9b466e66843350649abebf867bc22feeebda10d86e6787')

build() {
  cd "$pkgname-$pkgname-$pkgver"
  RUSTUP_TOOLCHAIN=stable \
    cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
