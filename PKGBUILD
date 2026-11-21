# Maintainer: kekmacska

pkgname=sqlite3pp
pkgver=1.0.10
pkgrel=1
pkgdesc='SQLite3++ - C++ wrapper of SQLite3 API'
arch=('any')
license=('MIT')
url='https://github.com/iwongu/sqlite3pp'
source=(
    "https://raw.githubusercontent.com/iwongu/sqlite3pp/refs/tags/v$pkgver/LICENSE"
    "https://raw.githubusercontent.com/iwongu/sqlite3pp/refs/tags/v$pkgver/headeronly_src/sqlite3pp.h"
    "https://raw.githubusercontent.com/iwongu/sqlite3pp/refs/tags/v$pkgver/headeronly_src/sqlite3pp.ipp"
    "https://raw.githubusercontent.com/iwongu/sqlite3pp/refs/tags/v$pkgver/headeronly_src/sqlite3ppext.h"
    "https://raw.githubusercontent.com/iwongu/sqlite3pp/refs/tags/v$pkgver/headeronly_src/sqlite3ppext.ipp"
)
depends=(sqlite)
provides=($pkgname)
sha256sums=('07fb289d3128bc433957e1adb7a1ea7fdab89ab625c9b858bcc406927edd2ddc'
            'e2f7e78bdebc86f775b507224802b0edbf2c22b7aab7ae04dcdfc08f2b53ad8b'
            'ac7450fd6d4bef8f07ccf80456a11c1a99c5ce7f5876cd75ef1fcce195e07c1f'
            '392b05548651186947c10d69bba463fca64f3c9f24c24a55850763318e7c308b'
            '3fa26365bc05f5284e6e8dbb699862aacbe79f73a894b8609e2b384ef4e2e49a')

package() {
    install -d "$pkgdir/usr/include"

    install -m644 "$srcdir"/*.h "$pkgdir/usr/include/"
    install -m644 "$srcdir"/*.ipp "$pkgdir/usr/include/"

    install -Dm644 "$srcdir/LICENSE" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
