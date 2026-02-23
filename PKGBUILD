pkgname=pg_hint_plan
_tag=REL18_1_8_0
_pgmajor=${_tag#REL}
_pgmajor=${_pgmajor%%_*}
_extver=${_tag#REL${_pgmajor}_}
pkgver=${_extver//_/.}
pkgrel=1
pkgdesc='Extension adding support for optimizer hints in PostgreSQL'
arch=('x86_64')
url='https://github.com/ossc-db/pg_hint_plan'
license=('PostgreSQL')
depends=('postgresql')
source=("$pkgname-$pkgver.tar.gz::$url/archive/refs/tags/$_tag.tar.gz")
sha256sums=('c3d8aa1e468b6b8371fb09d971152b9ac1610118fbd0c76c7e308e88a1cc0ef7')

build() {
  cd "$pkgname-$_tag"
  make
}

package() {
  cd "$pkgname-$_tag"
  make DESTDIR="$pkgdir" install
}
