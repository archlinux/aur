# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-irc
pkgver=r29.5ed3d5e
pkgrel=1
pkgdesc='IRC client protocol implementation for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-irc'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='5ed3d5e98d2cfe4e07bc81f395a996ff997d1a06'
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
