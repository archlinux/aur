# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=kirc
pkgver=0.3.0
pkgrel=1
pkgdesc="A tiny IRC client written in POSIX C99"
arch=('x86_64')
url="https://github.com/mcpcpc/kirc"
license=('MIT')
depends=('glibc')
makedepends=('git')
_commit='7ebf6b9fa2d6b7bf12d52d5f4bf65bfbf6fb889a'
source=("$pkgname::git+$url.git#commit=$_commit")
b2sums=('SKIP')

pkgver() {
  cd "$pkgname"

  git describe --tags
}

build() {
  cd "$pkgname"

  make
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install

  install -vDm644 -t "$pkgdir/usr/share/licenses/$pkgname" LICENSE
}
