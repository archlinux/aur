# Maintainer: Rakosn1cek <rakosn1cek@zohomail.eu>

pkgname=arch-update-readiness
pkgver=1.0.0
pkgrel=1
pkgdesc="Pre-update safety checks for Arch Linux (Arch News, system state, optional AUR checks)"
arch=('any')
url="https://github.com/Rakosn1cek/arch-update-check"
license=('MIT')
depends=('bash' 'curl' 'pacman' 'systemd')
optdepends=('yay: for optional AUR update checks')
source=("arch-update-check-${pkgver}.tar.gz::https://github.com/Rakosn1cek/arch-update-check/archive/refs/tags/v${pkgver}.tar.gz")
sha256sum arch-update-readiness-1.0.0.tar.gz

package() {
  install -Dm755 "arch-update-check-${pkgver}/arch-update-check.sh" \
    "$pkgdir/usr/bin/arch-update-check"
  install -Dm644 "arch-update-check-${pkgver}/README-arch-update-check.md" \
    "$pkgdir/usr/share/doc/arch-update-check/README-arch-update-check.md"
}
