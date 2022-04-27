# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-compress
pkgver=r26.2150858
pkgrel=1
pkgdesc="Compression algorithms for Hare"
arch=('any')
url="https://git.sr.ht/~sircmpwn/hare-compress"
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='2150858f269f81ff7736d20d30014f7aa7872dd4'
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
