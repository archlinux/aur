# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql-bin
_pkgname="${pkgname%-bin}"
pkgver=0.4.0
pkgrel=2
pkgdesc='A modern PostgreSQL manager TUI - Binary build'
arch=(x86_64)
url='https://github.com/fcoury/tsql'
license=('MIT')
source=("$_pkgname-$pkgver.tar.gz::https://github.com/fcoury/tsql/releases/download/v$pkgver/tsql-x86_64-unknown-linux-gnu.tar.gz"
    "LICENSE::https://raw.githubusercontent.com/fcoury/tsql/refs/tags/v$pkgver/LICENSE"
    "$_pkgname-$pkgver.tar.gz.asc"
    'LICENSE.asc')
provides=(${pkgname%-*}=$pkgver)
conflicts=(${pkgname%-*})
sha256sums=('054d3272ff8b43b79944333c59f5e3028fc35340572c048a554518db56637ae6'
            '279556e0ab3736896f0f313053d9a84b49743ae476a36a3724c31f1d7d853e20'
            'SKIP'
            'SKIP')
validgpgkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

package() {
    # cd "$_pkgname-$pkgver"
    install -Dm0755 -t "$pkgdir/usr/bin/" "$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
}

