# Maintainer: Filipe Cruz <filipecruz@tuta.io>
pkgname=playlist-maker-rs
_pkgname=playlist-maker
_binname=pl-mker
pkgver=0.1.1
pkgrel=1
pkgdesc='M3u playlist creator that uses query-like statments to find the requested songs, implemented in Rust'
arch=('i686' 'x86_64')
url="https://github.com/FilipeMCruz/playlist-maker"
license=('MIT')
makedepends=('cargo')
conflicts=(${pkgname}-bin)
source=("$pkgver.tar.gz::$url/archive/v$pkgver.tar.gz")
sha256sums=('7eb6e3882586f216b29b0b85a2e3f017165517061f5c3c32bf4ef50d93bb5aec')

build() {
  cd "$_pkgname-$pkgver"
  cargo build --release --locked
}

package() {
  install -Dm755 "$srcdir/$_pkgname-$pkgver/target/release/$_pkgname" "$pkgdir/usr/bin/$_binname"
}
