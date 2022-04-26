# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-md5
pkgver=r1.85e0e0b
pkgrel=1
pkgdesc='MD5 implementation for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-md5'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='85e0e0bc6255e23a28eff729ff04f20e00d14774'
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
