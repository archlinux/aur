# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator
pkgver=0.3.0
pkgrel=4
pkgdesc="A simple terminal-based TOTP authenticator written in Rust"
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator.git"
license=('GPL3')
depends=('glibc')
makedepends=('rust' 'git')
source=("https://github.com/clauderarch/kripton-authenticator/archive/dbf4c1b1774d4def36e268438a33f8c9afa2a806.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-dbf4c1b1774d4def36e268438a33f8c9afa2a806"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-dbf4c1b1774d4def36e268438a33f8c9afa2a806"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
