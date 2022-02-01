# Maintainer:

pkgname=greatest
pkgver=1.5.0
pkgrel=1
pkgdesc="A testing system for C"
arch=('any')
url="https://github.com/silentbicycle/greatest"
license=('custom:ISC')
makedepends=('git')
_commit='11a6af1919049df502405913da64fb385c219361'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

package() {
  cd "$pkgname"

  # library
  install -vDm644 -t "$pkgdir/usr/include" greatest.h

  # documentation
  install -vDm644 -t "$pkgdir/usr/share/doc/$pkgname" README.md

  # license
  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
