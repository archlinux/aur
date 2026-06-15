# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=git-guitar-bin
_pkgname=guitar
pkgver=0.1.54
pkgrel=1
pkgdesc='A terminal based git client with fast topological & chronological graph rendering - Pre-Build binary'
arch=('x86_64')
url='https://github.com/asinglebit/guitar'
license=('GPL-3.0-or-later')
depends=('git')
source=(
    "$_pkgname-$pkgver::$url/releases/download/v$pkgver/guitar-linux"
    "LICENSE::https://raw.githubusercontent.com/asinglebit/guitar/refs/tags/v$pkgver/LICENSE"
    "README.md::https://raw.githubusercontent.com/asinglebit/guitar/refs/tags/v$pkgver/README.md"
)
provides=('guitar')
conflicts=('git-guitar' 'git-guitar-git')
replaces=('guitar-tui-bin')
sha256sums=(
    'e8230be47278639d485f2b9ac5c0ed66656e3fcc3960fed8ab0217ed877dead1'
    '36874402d076b70d59c8a9db16bf8c9ca55a5b5b3cfc3906cd9fd390a679a608'
    'c346ac0892e58a3f2928bcc7fb7a7e50c30b3b093b415ca2d828bbe1b582ccac'
)

package() {
    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/guitar"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
