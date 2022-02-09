# Maintainer: kmille <github@androidloves.me>
# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=cryptboot
pkgver=1.2.0
pkgrel=1
pkgdesc="Encrypted boot partition manager with UEFI Secure Boot support"
arch=('any')
url="https://github.com/xmikos/cryptboot"
license=('GPL3')
depends=('cryptsetup' 'grub' 'efibootmgr' 'efitools' 'sbsigntools')
source=(https://github.com/kmille/cryptboot/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('53863e54be9bcd6bd47ad05b5c0afbcaae139d590106ef098da275adb86f46e6')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 cryptboot "$pkgdir/usr/bin/cryptboot"
  install -Dm755 cryptboot-efikeys "$pkgdir/usr/bin/cryptboot-efikeys"
  install -Dm755 grub-install "$pkgdir/usr/local/bin/grub-install"
  install -Dm644 cryptboot.conf "$pkgdir/etc/cryptboot.conf"
}

# vim:set ts=2 sw=2 et:
