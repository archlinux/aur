# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-iobus
pkgver=r45.0a0d6ff
pkgrel=1
pkgdesc='IO Bus abstraction for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-iobus'
license=('MPL2')
depends=(
  'hare'
  'hare-linux'
)
makedepends=('git')
_commit='0a0d6ff6c9bb823bad06f9c6fbddf16919f44881'
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
