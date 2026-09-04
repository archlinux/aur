# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=tsql-bin
_pkgname="${pkgname%-bin}"
pkgver=0.7.0
pkgrel=2
pkgdesc='A modern PostgreSQL and MongoDB manager TUI - Binary build'
arch=('x86_64')
url='https://github.com/fcoury/tsql'
license=('MIT')
options=(
    !debug
    !lto
)
source=(
    "$_pkgname-$pkgver.tar.gz::https://github.com/fcoury/tsql/releases/download/v$pkgver/tsql-x86_64-unknown-linux-gnu.tar.gz"
    "LICENSE-${pkgver}::https://raw.githubusercontent.com/fcoury/tsql/refs/tags/v$pkgver/LICENSE"
)
provides=('tsql')
conflicts=($_pkgname 'tsql-git')
sha256sums=(
    '8aa969920ab8de6a1be2ff52397f195120f6c4c3a36f05aa0c5dc632cab32cdf'
    '279556e0ab3736896f0f313053d9a84b49743ae476a36a3724c31f1d7d853e20'
)

package() {
    install -Dm0755 tsql "$pkgdir/usr/bin/tsql"
    install -Dm644 LICENSE-"$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}

# vim: ts=4 sw=4 et:
