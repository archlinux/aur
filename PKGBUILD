# Maintainer: Filipe Cruz <filipecruz@tuta.io>
pkgname=playlist-maker-rs
_pkgname=playlist-maker
_binname=pl-mker
pkgver=v.0.0.1
pkgrel=1
pkgdesc='M3u playlist creator that uses query-like statments to find the requested songs, implemented in Rust'
arch=('i686' 'x86_64')
url="https://github.com/FilipeMCruz/playlist-maker"
license=('MIT')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/$pkgver.tar.gz")
sha256sums=('8d250ceb2df0fdb0874b369c1ccb4b9d402995d8dbe57e3686f99b466e9a712a')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_binname"
}
