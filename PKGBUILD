pkgname=sitelen-pona-us-keyboard-layout
pkgver=1.0
pkgrel=1
pkgdesc="Sitelen Pona keyboard layout for IBus Table"
arch=('any')
license=('GPLv3')
depends=('ibus' 'ibus-table')
source=("sitelen_pona_ibus.txt")
install="${pkgname}.install"
sha256sums=('SKIP')

build() {
  ibus-table-createdb -n "${srcdir}/tokipona.db" -s "${srcdir}/sitelen_pona_ibus.txt"
}

package() {
  install -Dm644 "$srcdir/tokipona.db" "$pkgdir/usr/share/ibus-table/tables/tokipona.db"
}
