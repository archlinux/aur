# Maintainer: hir0xygen <aur (at) hir0.pw>
pkgname=sentinelguard
pkgver=r8.13de5ac
pkgrel=1
pkgdesc="On-the-fly toggling of security features for integration with Steam games"
arch=('x86_64')
url="https://github.com/hir0xygen/sentinelguard"
license=('MIT')
depends=('glibc')
makedepends=('gcc' 'git' 'cmake' 'make')
source=("git+https://github.com/hir0xygen/sentinelguard.git")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short=7 HEAD)"
}

build() {
  cd "$srcdir/$pkgname"
  mkdir -p build
  cd build
  cmake ..
  make
}

package() {
  cd "$srcdir/$pkgname/build"
  install -Dm4755 sentinelguard "$pkgdir/usr/bin/sentinelguard"
}

# vim:set ts=2 sw=2 et:

