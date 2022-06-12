# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-scfg
pkgver=r12.822eb86
pkgrel=1
pkgdesc='scfg implementation for Hare'
arch=('any')
url='https://git.sr.ht/~chrisppy/hare-scfg'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='822eb868ddd40df3b19e862303cdeddc33c3c1e4'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

check() {
  cd "$pkgname"

  make check
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
