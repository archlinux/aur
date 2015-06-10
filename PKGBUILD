# Maintainer: Alexander F Rødseth <rodseth@gmail.com>

pkgname=nimble-git
pkgver=186
pkgrel=2
pkgdesc='Package manager for the Nimrod programming language'
arch=('x86_64' 'i686')
url='https://github.com/nimrod-code/nimble'
license=('BSD')
makedepends=('nim' 'git')
conflicts=('nimble')
replaces=('nimble')
source=("$pkgname::git+https://github.com/nimrod-code/nimble.git")
md5sums=('SKIP')

pkgver () {
  cd "$pkgname"

  git rev-list --count master
}

build() {
  cd "$pkgname/src/"

  nim c -d:release nimble.nim
}

package() {
  cd "$pkgname"

  install -Dm755 "src/nimble" "$pkgdir/usr/bin/nimble"
  install -Dm644 "license.txt" "$pkgdir/usr/share/licenses/$pkgname/license.txt"
}

# vim:set ts=2 sw=2 et:
