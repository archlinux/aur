# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-compress
pkgver=r23.2eff2af
pkgrel=1
pkgdesc="Compression algorithms for Hare"
arch=('any')
url="https://git.sr.ht/~sircmpwn/hare-compress"
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='2eff2afd4033e806b591e8709c766247d9845c0e'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"

  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

package() {
  cd "$pkgname"

  make DESTDIR="$pkgdir" PREFIX=/usr install
}
