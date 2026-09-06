# Maintainer: Umar Alfarouk <medrivia@gmail.com>

pkgname=hashline-bin
_pkgname=hashline
pkgver=0.9.16
pkgrel=1
pkgdesc="Hash-anchored line editing for AI coding agents — O(1) line addressing via content-hashed anchors and drift-safe surgical patches"
arch=('x86_64')
url="https://github.com/quangdang46/$_pkgname"
license=('MIT' 'Apache-2.0')
depends=()
provides=("$_pkgname=$pkgver")
conflicts=("$_pkgname")
options=('!debug')
source=("$_pkgname-$pkgver-x86_64.tar.gz::$url/releases/download/v$pkgver/$_pkgname-v$pkgver-linux-x86_64.tar.gz"
        "LICENSE-$pkgver::https://raw.githubusercontent.com/quangdang46/$_pkgname/v$pkgver/MIT")
sha256sums=('b5f079adac74fb78f2a353d330c57651a6db0aca3d8cf8a1cf483f512d4837e5'
            'ebb5e71bc9cf9a2b324d71576d646d2f69d613672dc12fca3b7ecc0f040596d7')

package() {
  cd "$_pkgname-v$pkgver-linux-x86_64"
  install -Dm755 "$_pkgname" "$pkgdir/usr/bin/$_pkgname"

  cd "$srcdir"
  install -Dm644 "LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
