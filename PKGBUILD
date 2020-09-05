# Maintainer: Dr-Noob <peibolms at gmail dot com>
_name=cpufetch
pkgname="$_name-git"
pkgver=0.7
pkgrel=1
pkgdesc="Simplistic yet fancy CPU architecture fetching tool"
arch=('x86_64')
url="https://github.com/Dr-Noob/cpufetch"
license=('MIT')
depends=('glibc')
makedepends=('git')
source=("git+https://github.com/Dr-Noob/cpufetch")
md5sums=('SKIP')

build() {
  cd "$srcdir/$_name"
  make
}

package() {
  cd "$srcdir/$_name"
  install -Dm755 "cpufetch"   "$pkgdir/usr/bin/cpufetch"
  install -Dm644 "LICENSE"    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
  install -Dm644 "cpufetch.8" "$pkgdir/usr/share/man/man8/cpufetch.8.gz"
}
