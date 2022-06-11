# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-xml
pkgver=r42.1e4db08
pkgrel=1
pkgdesc='XML support for Hare'
arch=('any')
url='https://git.sr.ht/~sircmpwn/hare-xml'
license=('MPL2')
depends=('hare')
makedepends=('git')
_commit='1e4db08b0ccc1168b9c552467f933be3fc6b24f7'
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
