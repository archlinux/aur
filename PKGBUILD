# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-xml
pkgver=r38.1e8d523
pkgrel=1
pkgdesc="XML support for Hare"
arch=('any')
url="https://git.sr.ht/~sircmpwn/hare-xml"
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='1e8d523fc18a3ba298eaeb5a39cd7c3995dd8a96'
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
