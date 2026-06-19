# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=git-guitar-bin
_pkgname=guitar
pkgver=0.2.5
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
    '7781275af4484a32b0641382e9ffee301227659723983ccc0443518c5bc70db6'
    '36874402d076b70d59c8a9db16bf8c9ca55a5b5b3cfc3906cd9fd390a679a608'
    'd9805161249305936dbe223ceec608d6d6ebd47c5a56f0106e928b9808848af0'
)

package() {
    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/guitar"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

# vim: ts=4 sw=4 et:
