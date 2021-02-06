# Maintainer: Filipe Cruz <filipecruz@tuta.io>
pkgname=playlist-maker-rs
_pkgname=playlist-maker
_binname=pl-mker
pkgver=0.0.1
pkgrel=1
pkgdesc='M3u playlist creator that uses query-like statments to find the requested songs, implemented in Rust'
arch=('i686' 'x86_64')
url="https://github.com/FilipeMCruz/playlist-maker"
license=('MIT')
makedepends=('cargo')
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('d029d62859a2bc66723d66bfac3611bca944da592c0049ad81d421fa9a51f939')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_binname"
}
