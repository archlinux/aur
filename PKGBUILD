# Maintainer: lmartinez-mirror <lmartinez-mirror at noreply dot github dot com>
pkgname=baru
pkgver=0.2.7
pkgrel=1
pkgdesc='A system monitor written in Rust and C'
arch=('x86_64')
url='https://github.com/doums/baru'
license=('MPL2')
depends=('libpulse')
makedepends=('git' 'rust' 'cmake')
source=("$pkgname-$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha512sums=('1afb3f72510640778c4b2980e45aebac091cbee3884f74ca017416393541880bd71d6309f42a820edef1f011eb8a6f64e61d000b92fe97f1db3ba477e60ee5fb')

build() {
  cd "$pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  cd "$pkgname-$pkgver"
  install -Dm 755 "target/release/$pkgname" -t "$pkgdir/usr/bin/"
}

