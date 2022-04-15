# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=fnlfmt
pkgver=0.2.2
pkgrel=1
pkgdesc='A formatter for Fennel code'
arch=('any')
url='https://git.sr.ht/~technomancy/fnlfmt'
license=('GPL3')
depends=('lua')
makedepends=('git')
_commit='6325724f26fa48e5e60ca3064ae87eefb9e2e66b'
source=("$pkgname::git+$url#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags | sed 's/^v//'
}

build() {
  cd "$pkgname"

  make
}

check() {
  cd "$pkgname"

  make test
}

package() {
  cd "$pkgname"

  install -vDm755 -t "$pkgdir/usr/bin" fnlfmt
}
