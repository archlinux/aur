# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-linux
pkgver=r60.1eff9c1
pkgrel=1
pkgdesc="Extended Linux support for Hare"
arch=('any')
url="https://git.sr.ht/~sircmpwn/hare-linux"
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='1eff9c14877d1f49028e614ccba9ddd0dfa2168d'
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
