# Maintainer: Filipe Cruz <filipecruz@tuta.io>
pkgname=playlist-maker-rs-git
_pkgname=playlist-maker
_binname=pl-mker
pkgver=0.1.1
pkgrel=1
pkgdesc='M3u playlist creator that uses query-like statments to find the requested songs, implemented in Rust : git version'
arch=('i686' 'x86_64')
url="https://github.com/FilipeMCruz/playlist-maker"
license=('MIT')
makedepends=('git' 'cargo')
conflicts=('playlist-maker-rs-bin' 'playlist-maker-rs')
source=("$_pkgname::git+$url")
sha256sums=('SKIP')

build() {
  cd "$_pkgname"
  cargo build --release
}

package() {
  install -Dm755 "$srcdir/$_pkgname/target/release/$_pkgname" "$pkgdir/usr/bin/$_binname"
}
