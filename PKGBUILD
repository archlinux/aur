# Maintainer: Nico <d3sox at protonmail dot com>
pkgname=tunnelto
pkgver=0.1.14
pkgrel=1
pkgdesc="Expose your local web server to the internet with a public URL."
arch=('any')
url="https://tunnelto.dev/"
license=('MIT')
makedepends=('cargo' 'git')
conflicts=('tunnelto')
provides=('tunnelto')
source=("git+https://github.com/agrinman/$pkgname#tag=$pkgver")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked --all-features --target-dir=target
}

package() {
  cd "$srcdir/$pkgname"
  # install binary
  install -Dm 755 target/release/tunnelto -t "${pkgdir}/usr/bin"
  #install -Dm 755 target/release/tunnelto_server -t "${pkgdir}/usr/bin"
}
