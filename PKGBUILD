# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=git-guitar-bin
_pkgname=guitar
pkgver=0.1.44
pkgrel=3
pkgdesc='A terminal based git client with fast topological & chronological graph rendering - Pre-Build binary'
arch=('x86_64')
url='https://github.com/asinglebit/guitar'
license=('GPL-3.0')
depends=(git)
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/guitar-linux"
    "LICENSE::https://raw.githubusercontent.com/asinglebit/guitar/refs/tags/v$pkgver/LICENSE"
    "README.md::https://raw.githubusercontent.com/asinglebit/guitar/refs/tags/v$pkgver/README.md"
    "$_pkgname-$pkgver.asc"
    'LICENSE.asc'
    'README.md.asc')
provides=(guitar)
conflicts=('git-guitar' 'git-guitar-git')
replaces=('guitar-tui-bin')
sha256sums=('0793b4219c195d8edf4eab87f1510cd1b37b5e3a65b2cb4aaaf80a7b33bbe434'
            '36874402d076b70d59c8a9db16bf8c9ca55a5b5b3cfc3906cd9fd390a679a608'
            'f37fd448332e5175a0045a65450a2779a3a557713b5fd036c79a28a1f0a3e502'
            'SKIP'
            'SKIP'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

package() {
    install -Dm0755 "$_pkgname-$pkgver" "$pkgdir/usr/bin/$_pkgname"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/" LICENSE
    install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/" README.md
}

