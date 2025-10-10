# Maintainer: Anders <clauderarch@tutamail.com>
pkgname=kripton-authenticator
epoch=1
pkgver=0.6.0
pkgrel=7
pkgdesc="A simple terminal-based TOTP authenticator written in Rust"
arch=('x86_64')
url="https://github.com/clauderarch/kripton-authenticator.git"
license=('GPL3')
depends=('glibc')
makedepends=('rust' 'git')
source=("https://github.com/clauderarch/kripton-authenticator/archive/18efb3ef58bc7f213842b24a427c3d3d0fda1847.tar.gz")
sha256sums=('SKIP')

build() {
  cd "$srcdir/${pkgname}-18efb3ef58bc7f213842b24a427c3d3d0fda1847"
  cargo build --release
}

package() {
  cd "$srcdir/${pkgname}-18efb3ef58bc7f213842b24a427c3d3d0fda1847"
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
