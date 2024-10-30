# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-compress
pkgver=r53.a4bb204
pkgrel=1
pkgdesc='Compression algorithms for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-compress'
license=('MPL-2.0')
depends=('hare')
makedepends=('git')
_commit='a4bb204305ef67a39dc1af3e8e843a2a4f5bee45'
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
