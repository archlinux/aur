# Maintainer: Brenek Harrison <brenekharrison @ gmail d0t com>

# Adapted for versioned releases from
#     https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=betterdiscordctl-git&id=691aa5e977086466b709b6068e955f774a255965

pkgname=betterdiscordctl
pkgver=2.1.0
pkgrel=1
pkgdesc="A utility for managing BetterDiscord on Linux"
arch=('any')
url="https://github.com/bb010g/betterdiscordctl"
license=('MIT')
depends=('curl')
conflicts=("betterdiscordctl-git")
source=("$pkgname-$pkgver.tar.gz::https://github.com/bb010g/betterdiscordctl/archive/refs/tags/v$pkgver.tar.gz")
sha256sums=('7bf980b4ca61ebe8defc67a3452156b2f5765db46e7a777a753321ed6bd23e4f')

prepare() {
  cd "$srcdir/$pkgname-$pkgver"
  sed -i 's/^DISABLE_SELF_UPGRADE=$/&yes/' betterdiscordctl
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 betterdiscordctl "$pkgdir/usr/bin/betterdiscordctl"
  install -Dm644 LICENSE.md "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
