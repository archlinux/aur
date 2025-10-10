# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator
pkgver=0.4.0
pkgrel=5
pkgdesc="A simple terminal-based TOTP authenticator written in Rust"
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator.git"
license=('GPL3')
depends=('glibc')
makedepends=('rust' 'git')
source=("https://github.com/clauderarch/kripton-authenticator/archive/74adadc6e90a47a76891afac24e7a10277ed8986.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-74adadc6e90a47a76891afac24e7a10277ed8986"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-74adadc6e90a47a76891afac24e7a10277ed8986"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
