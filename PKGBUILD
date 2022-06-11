# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-compress
pkgver=r28.ad504ee
pkgrel=1
pkgdesc='Compression algorithms for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-compress'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='ad504ee8520259eb1601f7718a650e43ce25c522'
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
