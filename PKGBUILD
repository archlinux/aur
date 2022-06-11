# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-atom
pkgver=r30.cb360e4
pkgrel=1
pkgdesc='Atom implementation for Hare'
arch=('any')
url='https://git.sr.ht/~chrisppy/hare-atom'
license=('MPL2')
depends=(
  'hare'
  'hare-xml'
)
makedepends=('git')
_commit='cb360e4b55dbc67a35a8a15343ca8a1d800864a1'
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
