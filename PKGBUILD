# Maintainer: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=wal2json
pkgver=2_2
pkgrel=1
pkgdesc="Output plugin for logical decoding PostgreSQL WAL's"
arch=(i686 x86_64)
url="https://github.com/eulerto/wal2json"
license=('BSD')
depends=('postgresql>=9.4')
install="wal2json.install"
source=("https://github.com/eulerto/wal2json/archive/${pkgname}_${pkgver}.tar.gz"
        "wal2json.install")
sha256sums=('e2cb764ee1fccb86ba38dbc8a5e2acd2d272e96172203db67fd9c102be0ae3b5'
            '4dcef8c4e2c6badb3c68af16235632b042e867cbef0beecac4734acb53f7915c')

build() {
  cd "$srcdir/${pkgname}-${pkgname}_${pkgver}"
  USE_PGXS=1 make
}

package() {
  cd "$srcdir/${pkgname}-${pkgname}_${pkgver}"
  USE_PGXS=1 make DESTDIR="$pkgdir" install
  install -Dm644 LICENSE "$pkgdir"/usr/share/licenses/wal2json/LICENSE
}

