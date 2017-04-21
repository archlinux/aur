# Maintainer: Vlad M. <vlad@archlinux.net>

pkgname=cargo-watch
pkgver=5.0.0
_pkgver=$pkgver-justwrapit
pkgrel=1
pkgdesc="Utility for Cargo to compile projects when sources change"
arch=('i686' 'x86_64')
url="https://github.com/passcod/cargo-watch"
license=('CC0-1.0')
depends=('cargo' 'watchexec')
source=("$url/archive/v$_pkgver/$pkgname-$_pkgver.tar.gz")
sha256sums=('9c369f223514dbe138eb9352c787fc6a0ea00d8d5ae78406054e4bada134b406')

build() {
  cd "$pkgname-$_pkgver"
  cargo build --release
}

package() {
  cd "$pkgname-$_pkgver"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
