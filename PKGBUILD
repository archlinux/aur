# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-irc
pkgver=r26.be10813
pkgrel=1
pkgdesc='IRC client protocol implementation for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-irc'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='be10813e1898314be0851d2c50d5fbafd9ac39aa'
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
