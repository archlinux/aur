# Maintainer: Evan Church frothycurve@gmail.com
pkgname=ghpkg
pkgver=1.0.0
pkgrel=1
pkgdesc="An indev package manager, using github repos, to build from source."
arch=('any')
url="https://github.com/user/ghpkg"
license=('MIT')
depends=('git')
source=("git+https://github.com/Frothy7650/ghpkg.git")
sha256sums=('SKIP')

build() {
  cd "$srcdir/$pkgname"
  v -os linux -prod main.v -o ghpkg
}

package() {
  cd "$srcdir/$pkgname"
  install -Dm755 ghpkg "$pkgdir/usr/bin/ghpkg"
  install -Dm644 db.json "$pkgdir/etc/ghpkg/db.json"
}

