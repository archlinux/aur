# Maintainer: nlion <nlion@nlion.nl>

pkgname=arch-manwarn-bin
pkgver=1.4.1
pkgrel=1
pkgdesc="Rust-based pacman hook that blocks updates if unread Arch News posts require manual intervention (binary release)"
arch=('x86_64')
url="https://github.com/NLion74/arch-manwarn"
license=('UNLICENSE')
depends=('pacman' 'curl')
conflicts=('arch-manwarn' 'informant')
provides=('arch-manwarn')

source=(
  "$pkgname-$pkgver.tar.gz::$url/releases/download/v$pkgver/arch-manwarn-x86_64.tar.gz"
)

sha256sums=('978a904290294ede22993d5549498fe3b35e0664dc14383d8dd470912cf75cf3')

package() {
  cd "$srcdir"

  install -Dm755 \
    "arch-manwarn" \
    "$pkgdir/usr/bin/arch-manwarn"

  install -Dm644 \
    "hooks/arch-manwarn.hook" \
    "$pkgdir/usr/share/libalpm/hooks/arch-manwarn.hook"

  install -Dm644 \
    "LICENSE" \
    "$pkgdir/usr/share/licenses/$pkgname/LICENSE"

  install -Dm644 \
    "README.md" \
    "$pkgdir/usr/share/doc/$pkgname/README.md"

  install -Dm644 \
    "man/arch-manwarn.1" \
    "$pkgdir/usr/share/man/man1/arch-manwarn.1"
}
