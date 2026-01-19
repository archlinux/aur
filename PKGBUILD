# Maintainer: Anas Elgarhy <anas.elgarhy.dev@gmail.com>
pkgname=git-guitar-bin
_pkgname=guitar
pkgver=0.1.44
pkgrel=1
pkgdesc='A terminal based git client with fast topological & chronological graph rendering - Pre-Build binary'
arch=('x86_64')
url='https://github.com/asinglebit/guitar'
license=('GPL-3.0')
depends=(git)
makedepends=(cargo)
source=("$_pkgname-$pkgver::$url/releases/download/v$pkgver/guitar-linux"
    "LICENSE::https://raw.githubusercontent.com/asinglebit/guitar/refs/tags/v$pkgver/LICENSE"
    "$_pkgname-$pkgver.asc"
    'LICENSE.asc')
provides=(guitar)
sha256sums=('0793b4219c195d8edf4eab87f1510cd1b37b5e3a65b2cb4aaaf80a7b33bbe434'
            '36874402d076b70d59c8a9db16bf8c9ca55a5b5b3cfc3906cd9fd390a679a608'
            'SKIP'
            'SKIP')
validpgpkeys=('EF4B4CB5DFB8822216A473B1597AB12E66262898')

package() {
    install -Dm0755 -t "$pkgdir/usr/bin/$_pkgname" "$_pkgname-$pkgver"
    install -Dm644 -t "$pkgdir/usr/share/licenses/$pkgname/LICENSE" LICENSE
    # install -Dm644 -t "$pkgdir/usr/share/doc/$pkgname/README.md" README.md
}

