# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-iobus
pkgver=r42.9ff0510
pkgrel=1
pkgdesc="IO Bus abstraction for Hare"
arch=('any')
url="https://git.sr.ht/~sircmpwn/hare-iobus"
license=('MPL2')
depends=(
  'hare'
  'hare-linux'
)
makedepends=('git')
_commit='9ff0510080ee38b7badf9c5ae2b83e7ac3991a2d'
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
