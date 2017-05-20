# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=5.0.4
pkgrel=1
pkgdesc="Utility for Cargo to compile projects when sources change"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo' 'watchexec')
source=("$url/archive/v$pkgver/$pkgname-$pkgver.tar.gz")
sha256sums=('87008358ce1bae8873916133cf8eb3fab88ddf08bf3261a0fd15530e1bfe46bd')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
