# PKGBUILD
# Maintainer: Devorlon

pkgname=brightness
pkgver=24.1.0
pkgrel=2
pkgdesc="Adjust monitor brightness using ddcutil"
arch=('x86_64')
url="https://gitlab.com/Devorlon/brightness"
license=('AGPLv3')
depends=('ddcutil')
makedepends=('rust')

source=("brightness::git+${url}.git")
md5sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  cargo build --release --locked
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 "target/release/${pkgname}" "${pkgdir}/usr/bin/brightness"
}
