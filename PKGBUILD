# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-md5
pkgver=r3.65e68b1
pkgrel=1
pkgdesc='MD5 implementation for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-md5'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='65e68b144edef9a84ce663b7e5064c8dd72cdb06'
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
