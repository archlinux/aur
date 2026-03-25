# Maintainer: Matt Payne <pattmayne at protonmail dot com>
# Contributor: Matt Payne <pattmayne at protonmail dot com>

pkgname=dwfall
pkgver=1.0.0.0.0
pkgrel=1
pkgdesc="A divider label creator with adjustable params, written in Nim"
arch=('x86_64')
url="https://github.com/PattMayne/divided_we_fall"
license=('MIT')
depends=('glibc')
makedepends=('nim' 'git')
source=("$pkgname::git+https://github.com/PattMayne/divided_we_fall.git")
sha256sums=('SKIP')

build() {
  cd "$pkgname"
  nim c -d:release -o:dwfall src/dwfall.nim
}

package() {
  cd "$pkgname"
  install -Dm755 dwfall "$pkgdir/usr/bin/dwfall"
}