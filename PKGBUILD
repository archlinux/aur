# Maintainer: kmille <github@androidloves.me>
# Maintainer: Michal Krenek (Mikos) <m.krenek@gmail.com>
pkgname=cryptboot
pkgver=1.2.1
pkgrel=2
pkgdesc="Encrypted boot partition manager with UEFI Secure Boot support"
arch=('any')
url="https://github.com/kmille/cryptboot"
license=('GPL3')
depends=('cryptsetup' 'grub' 'efibootmgr' 'efitools' 'sbsigntools')
source=(https://github.com/kmille/cryptboot/archive/refs/tags/v$pkgver.tar.gz)
sha256sums=('ec5c449a881739218144415f1a895ca497bc2db105289d16b4b4daa664c14c63')
backup=('etc/cryptboot.conf')

package() {
  cd "$srcdir/$pkgname-$pkgver"
  install -Dm755 cryptboot "$pkgdir/usr/bin/cryptboot"
  install -Dm755 cryptboot-efikeys "$pkgdir/usr/bin/cryptboot-efikeys"
  install -Dm755 grub-install "$pkgdir/usr/local/bin/grub-install"
  install -Dm644 cryptboot.conf "$pkgdir/etc/cryptboot.conf"
}

# vim:set ts=2 sw=2 et:
