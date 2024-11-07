# Maintainer: Ted Pinkerton <p_t@fastmail.net>
pkgname=markcat
pkgver=1.0.0
pkgrel=1
pkgdesc="A CLI tool to convert project directories to markdown format"
arch=('x86_64')
url="https://github.com/RunnersNum40/markcat"
license=('Unlicense')
depends=()
makedepends=('rust' 'cargo')
source=("$pkgname::git+https://github.com/RunnersNum40/markcat.git#branch=main")
sha256sums=('SKIP')
options=('!debug')

build() {
  cd "$srcdir/$pkgname" || exit
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname" || exit
  install -Dm755 "target/release/$pkgname" "$pkgdir/usr/bin/$pkgname"
}
