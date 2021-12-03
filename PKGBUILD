# Maintainer: George Rawlinson <grawlinson@archlinux.org>

pkgname=pg_graphql
pkgver=r108.0d712aa
pkgrel=2
pkgdesc="GraphQL support for PostgreSQL"
arch=('x86_64')
url="https://github.com/supabase/pg_graphql"
license=('Apache')
depends=('libgraphqlparser' 'postgresql' 'glibc')
makedepends=('git' 'clang' 'llvm')
_commit='0d712aa976f20c7d492855e65314d9531791f5b0'
source=("$pkgname::git+$url#commit=$_commit")
md5sums=('SKIP')

pkgver() {
  cd "$pkgname"
  printf "r%s.%s" "$(git rev-list --count HEAD)" "$(git rev-parse --short HEAD)"
}

build() {
  cd "$pkgname"
  make
}

package() {
  cd "$pkgname"
  make DESTDIR="$pkgdir" install
}
