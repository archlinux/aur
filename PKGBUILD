# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=hare-rss
pkgver=r9.2fc2dfa
pkgrel=1
pkgdesc='RSS implementation for Hare'
arch=('any')
url='https://git.sr.ht/~chrisppy/hare-rss'
license=('MPL2')
depends=(
  'hare'
  'hare-xml'
)
makedepends=('git')
_commit='2fc2dfa03ea6671a481a3f2a4317d104084413a9'
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
