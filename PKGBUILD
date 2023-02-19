# Maintainer: ProFfeSsoRr <evvsoft at gmail dot com>

pkgname=wal2json
pkgver=2_5
pkgrel=1
pkgdesc="Output plugin for logical decoding PostgreSQL WAL's"
arch=(i686 x86_64)
url="https://github.com/eulerto/wal2json"
license=('BSD')
depends=('postgresql>=9.4')
makedepends=('llvm')
install="wal2json.install"
source=("https://github.com/eulerto/wal2json/archive/${pkgname}_${pkgver}.tar.gz"
        "wal2json.install")
sha256sums=('b516653575541cf221b99cf3f8be9b6821f6dbcfc125675c85f35090f824f00e'
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

