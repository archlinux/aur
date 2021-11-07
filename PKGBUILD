# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>

# Adapted for versioned releases from
#     https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=betterdiscordctl-git&id=691aa5e977086466b709b6068e955f774a255965

pkgname=betterdiscordctl
pkgver=2.0.1
pkgrel=1
pkgdesc="A utility for managing BetterDiscord on Linux"
arch=('any')
url="https://github.com/bb010g/betterdiscordctl"
license=('MIT')
depends=('curl')
conflicts=("betterdiscordctl-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/bb010g/betterdiscordctl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('d56eaa43119bfeef96d842fb83ac943418389dd60d1a372a0e5e24e7eb68fecb')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/^DISABLE_SELF_UPGRADE=$/&yes/' betterdiscordctl
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 betterdiscordctl "$pkgdir/usr/bin/betterdiscordctl"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
