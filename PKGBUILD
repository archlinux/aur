# Maintainer: lovefromhsd <lovefromhsd@proton.me>

pkgname=raur-helper-git
pkgver=1b7421b
pkgrel=2
pkgdesc="Simple AUR helper written in Rust"
arch=('x86_64')
url="https://github.com/hsdcc/raur"
license=('MIT')
depends=()
makedepends=('git' 'rust')
provides=('raur')
conflicts=('raur')
source=("$pkgname::git+$url")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  git describe --tags --always | sed 's/^v//;s/-/./g'
}

build() {
  cd "$pkgname"
  cargo build --release
}

package() {
  cd "$pkgname"
  install -Dm755 target/release/raur "$pkgdir/usr/bin/raur"
}
