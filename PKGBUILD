# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-linux
pkgver=r63.6c8e4dc
pkgrel=1
pkgdesc='Extended Linux support for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-linux'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='6c8e4dc9e89363e372e5fd38cb03f8c5ba761505'
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
