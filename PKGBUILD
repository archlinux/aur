# Maintainer: qxb3 <qxbthree@gmail.com>
# Package: fum
# Description: A tui-based mpris music client.
# Version: 0.1.1
# License: MIT
# URL: https://github.com/qxb3/fum

pkgname=fum
pkgver=0.1.1
pkgrel=1
pkgdesc="A tui-based mpris music client."
arch=('x86_64')
url="https://github.com/qxb3/fum"
license=('MIT')
depends=('rust' 'cargo' 'glib2')
makedepends=('rust' 'cargo' 'git')
source=("git+https://github.com/qxb3/$pkgname.git#branch=main")
sha256sums=('SKIP')

# Build function
build() {
  cd "$srcdir/${pkgname}"
  cargo build --release
}

# Package function
package() {
  cd "$srcdir/${pkgname}"
  install -Dm755 "target/release/fum" "$pkgdir/usr/bin/fum"
  install -Dm644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
