# Maintainer: killab33z <killab33z @ protonmail-dot-ch>
pkgname=adalanche-bin
_pkgname="${pkgname%-bin}"
pkgver=v2024.1.11
pkgrel=1
pkgdesc="Active Directory ACL Visualizer and Explorer - who's really Domain Admin?"
arch=('x86_64')
url="https://github.com/lkarlslund/adalanche"
license=('AGPL-3.0-only')
makedepends=('go>=1.23')
provides=("$_pkgname")
conflicts=("$_pkgname" "$_pkgname-git")
source=("$url/releases/download/$pkgver/$_pkgname-linux-x64-$pkgver"
        "https://raw.githubusercontent.com/lkarlslund/Adalanche/refs/heads/master/license.MD")
sha512sums=('12e7deea4ae4e1dd2cd741ba91f2b625c4051cb1bdc64b04555bfa0b6efc9f3f90a90d1e56f9bad06348c7fbc75029149a4bb4765d3a2142ef582cd6b5134154'
            '3a40f27c2ce0ee858a83ffe70ac0ef1ad8b5d017db61c9b2b9dace3c6e295fa84bc51e36dc35cbe04f43b6b11f56d4b594517bc72a82bec094407ed1ebf0422b')

package() {
  install -Dm0755 $srcdir/$_pkgname-linux-x64-$pkgver "$pkgdir/usr/bin/$_pkgname"
  install -Dm644 -t "$pkgdir/usr/share/licenses/$_pkgname" license.MD
}

